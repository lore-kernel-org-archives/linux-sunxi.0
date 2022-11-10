Received: from smtp-4.b-tu.de (smtp-4.b-tu.de [141.43.208.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ED620E3
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Nov 2022 11:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp-4.b-tu.de (Postfix) with ESMTP id 4N7Jyl60L2zGsZXD;
	Thu, 10 Nov 2022 12:10:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=b-tu.de; h=
	content-transfer-encoding:content-type:content-type:mime-version
	:x-mailer:references:in-reply-to:message-id:subject:subject:from
	:from:date:date:received:received; s=smtp; t=1668078605; x=
	1668942606; bh=UufqRW4v9C+qLifPhmKaQ8o1r+SUf2k3/0OoPxuP/s4=; b=B
	gCCWbYoK35n0842by6R7mwW3E5lsToewAv74Tl3fzWcvTh4UWLswGlAtvfbg32zI
	ORvqiCR687u4i3j5K0fw0bs3rvAN7kp/4Gzzt/AxDoREupHKIC/f6RvwJSnX9M2S
	2E0sSVvx9vZZ3E9rdjkiL/YAVKWTOIjk1+/0srOsnc=
X-Virus-Scanned: by AMaViS (at smtp-4.b-tu.de)
Received: from smtp-4.b-tu.de ([127.0.0.1])
	by localhost (smtp-4.b-tu.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5KJjA6YZ_O95; Thu, 10 Nov 2022 12:10:05 +0100 (CET)
Received: from rosh (rosh.math.tu-cottbus.de [141.43.65.40])
	(Authenticated sender: dikarill@b-tu.de)
	by smtp-4.b-tu.de (Postfix) with ESMTPSA id 4N7Jyf1ZJRzGsZXF;
	Thu, 10 Nov 2022 12:10:01 +0100 (CET)
Date: Thu, 10 Nov 2022 12:10:01 +0100
From: Ilya Dikariev <dikarill@b-tu.de>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Samuel
 Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/clocksource/arm_arch_timer: Tighten Allwinner
 arch timer workaround
Message-ID: <20221110121001.214a851d@rosh>
In-Reply-To: <87k043us6e.wl-maz@kernel.org>
References: <20221109221049.4bf3c5bb@rosh>
	<87k043us6e.wl-maz@kernel.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

El Thu, 10 Nov 2022 08:31:21 +0000
Marc Zyngier <maz@kernel.org> escribi=C3=B3:

MZ> >=20
MZ> > As we know, the Allwinner A64 SoC has a buggy RCU time unit. The =20
MZ>=20
MZ> What is RCU?

I think I called it wrong. Anyway I mean the HR timer of A64.

MZ>=20
MZ> > workaround named UNKNOWN1 was not sufficient to cover some more buggy
MZ> > bunches of this SoC. This workaround diminish the mask to 8 bits inst=
ead
MZ> > of 9.
MZ> >=20
MZ> > An example run of timer test tool https://github.com/smaeul/timer-too=
ls
MZ> > on PinePhone device (owns the A64 SoC) gives following result on a non
MZ> > patched kernel (cut off):
MZ> >=20
MZ> > Running parallel counter test...
MZ> > 0: Failed after 5507 reads (0.003578 s)
MZ> > 0: 0x0000000c8272cbf1 -> 0x0000000c8272ccff -> 0x0000000c8272cc0e (  =
   0.011 ms)

[......]

MZ> > After the proposed patch applied the test runs
MZ> > correctly (~2 hours of testing with a tool above without fails) =20
MZ>=20
MZ> 2 hours seems like an incredibly small amount of time given that the
MZ> existing workaround was believed to be correct. Run it continuously
MZ> for a couple of weeks on several different machines with varying
MZ> workloads and less us know the outcome.

The only A64 machine I own is the Pinephone. First time I did this patch
~9 month ago (on behalf os Samuel). Before it the system suffered hangs
every 15-20 minutes and backward time jumps ~1 time a day.
Since applying of this patch none of above occurred.
To be honest, I never did long tests (weeks). I will put the device
on a probe for some weeks and let you know then.


Best regards,
Ilya


--=20
=D0=B7=D0=B0=D0=BF=D1=80=D1=8F=D0=B3=D0=B0=D0=B9 =D0=BC=D0=B5=D0=B4=D0=BB=
=D0=B5=D0=BD=D0=BD=D0=BE,
=D0=B5=D0=B4=D1=8C =D0=B1=D1=8B=D1=81=D1=82=D1=80=D0=BE!
