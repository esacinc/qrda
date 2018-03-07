package gov.cms.qrda.schematron.merge;

/*
Copyright (c) 2018+, ESAC, Inc.
All rights reserved.
Redistribution and use in source and binary forms, with or without modification, 
are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this 
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, 
   this list of conditions and the following disclaimer in the documentation 
   and/or other materials provided with the distribution.
 * Neither the name of HL7 nor the names of its contributors may be used to 
   endorse or promote products derived from this software without specific 
   prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
POSSIBILITY OF SUCH DAMAGE
 */




import java.util.Timer;
import java.util.TimerTask;

/**
 * This is the class manages a timer that may or may not output a "." character
 * to the system console as the merge process proceeds. Upon terminating the timer,
 * the elapsed time that the timer ran is returned (truncated to seconds)
 * 
 * @author Dan Donahue ESAC Inc.
 *
 */
public class ProgressTimer {

    static int counter = 0;
    boolean doOutput = false;
    long startTime = 0;
    long endTime = 0;
    Timer timer = null;
    
    /**
     * Constructor for the timer. The boolean argument controls whether a
     * "." character is output to the system console every time the timer fires.
     * 
     * @param showOutput  true: output "." character to system console. 
     *                    false: no output generated.
     */
    public ProgressTimer(boolean showOutput) {
    	doOutput = showOutput;
    	startTime = System.currentTimeMillis();
        TimerTask timerTask = new TimerTask() {
            @Override
            public void run() {
                if (doOutput) System.out.print(".");
                counter++;//increments the counter
            }
        };
        if (doOutput) System.out.print("    ");
        timer = new Timer("ProgressTimer");//create a new Timer

        timer.scheduleAtFixedRate(timerTask, 30, 1000);//this line starts the timer at the same time its executed
    }
    
    /**
     * Cancels the timer if it is running, and returns the elapsed time (in seconds) that the timer has run.
     * 
     * @return elapsed runtime of the timer, in seconds.
     */
    public long stop() {
    	endTime = System.currentTimeMillis();
    	if (timer != null) {
    		timer.cancel();
    	}
    	if (doOutput) System.out.println(".");
    	return (endTime - startTime)/1000;
    }
}
