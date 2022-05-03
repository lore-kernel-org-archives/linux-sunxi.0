Received: from skyrocket.fabmicro.ru (skyrocket.fabmicro.ru [217.116.57.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645C133C9
	for <linux-sunxi@lists.linux.dev>; Tue,  3 May 2022 21:38:05 +0000 (UTC)
Received: from mail.fabmicro.ru (skyrocket.fabmicro.ru [217.116.57.130])
	by skyrocket.fabmicro.ru (8.14.9/8.14.9) with ESMTP id 243LbWgS088440;
	Tue, 3 May 2022 21:37:32 GMT
	(envelope-from rz@fabmicro.ru)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 04 May 2022 02:37:32 +0500
From: Ruslan Zalata <rz@fabmicro.ru>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Guenter Roeck <linux@roeck-us.net>, Icenowy Zheng <icenowy@aosc.io>,
        Jean Delvare <jdelvare@suse.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej
 Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2] hwmon: (sun4i-lradc) Add driver for LRADC found on
 Allwinner A13/A20 SoC
In-Reply-To: <20220503161446.tl3qoqqnkzq2f3hn@houat>
References: <20220428210906.29527-1-rz@fabmicro.ru>
 <20220502110010.q7vvdkdpaiz5acjl@houat>
 <7433B295-D896-4BF8-87DF-87EB89D7A550@aosc.io>
 <20220502112112.3ne7zy4b6gggxzoo@houat>
 <4aabfd63-18e2-65c5-d1c2-d7600afc1c40@roeck-us.net>
 <97e3af18e947492b1ac968c058ba509f@fabmicro.ru>
 <20220503161446.tl3qoqqnkzq2f3hn@houat>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <18ded45dcd670edcc9eb9811e7c7c034@fabmicro.ru>
X-Sender: rz@fabmicro.ru
Organization: Fabmicro, LLC.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	skyrocket.fabmicro.ru

Hi Maxime,

> At the hardware level, I'd assume you would either use the LRADC as an
> actual ADC, or use it to drive buttons, right?

Yes, exactly.

> So I don't think a new device tree binding is such a deal breaker since
> you have to describe it differently anyway.

...

> Since that would be a completely different use-case, the IIO driver
> doesn't have to support input right away, it can be done later if
> needed.
> 
> And you could have the two drivers compiled at the same time.

As I got you right, you propose do add new bindings, say 
"allwinner,sun4i-a10-lradc-hwmon" and "allwinner,sun8i-a83t-lradc-hwmon" 
for new driver, which will allow two drivers (hwmon and keyboard) be 
compiled and loaded at same time, only that one listed in DT will be 
instantiated. If two are listed at same time, one of the calls to 
devm_request_irq() will return with an error preventing second driver to 
be probed (some error message would be necessary to let user know what's 
going on). If this is ok, I will implement it.

I think moving this driver to IIO framework is overkill. We use LRADC to 
monitor battery temp and state (voltage) and that's what HWMON was made 
for. It's simple, easy and elegant. IIO, on the other hand, is for data 
acquisition and is much more complex beast. Can we stay with HWMON, 
please ? :)

I looked through the code for a number of iio/adc drivers and I could 
see that all of them initiate ADC conversion inside read(), then wait 
for completion and return single sample. For me this very flawed 
approach because a) much more overhead/load on the system, b) initiating 
conversion may (and will) take more time than a single consequent 
conversion, c) samples will be read in irregular periods of time, hence 
acquired data will not be consistent for any further processing (like 
FFT). So, this whole IIO framework is no way better than HWMON, yet more 
complex. At least for ADCs. :-)

A better approach for an IIO/ADC driver would be to implement some 
serialization mechanism to let reads go in sync with updates (IRQs), 
with buffering, guaranteeing no same sample is read twice and no sample 
is lost. The read() would return next available sample from buffer with 
nearly zero overhead or sleep till data is available.

And the best way is to extend IIO framework to support ring buffers 
mechanism like the one proposed by Analog Devices, but that's a way 
different story. Link: 
https://events.static.linuxfound.org/sites/events/files/slides/iio_high_speed.pdf

Regards,
Ruslan.

Fabmicro, LLC.
