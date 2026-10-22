Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695781;
	b=CpHDmBURoRpI2ga9kxK/KjIkt6kXQ8zL3yyjRLNGETYEe0xXPiRNb1i2HHVhB2wpSqba
	 9MU/2n7w/8D0kAoMAqu9npnXJDNUy2swe/4S6sQvwxtMDXtUDJ19FMVWCiNse4pk6959d
	 7KdHI9MAf0P8RjUKjdKeFf/Od7Bxv9ddDCvl8bAfdsEe8iRJ44y0+bpalDPuRiCVKiluu
	 GBMGENRzPCh+gjip6C9BChfL86si6rhDCnExwqzVGCfaitPv7uPt33qglAwa5lTxOqOns
	 HLKiveSMyv2QzqOUcGppKgKboci0Y4ydfjnTRNBf64K+pOE7TWb/Jb9X119AXd4b/Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7dOAuB9XyFaeFfFVegEDpoF2gtsk0VyOm+nWLSWg1aM=;
	b=oewFvjW/Kc2eEfK3k83ur9NAhgCTovP+gG9hs2jHoAg3dwaEeCCxHP2rr+K+ILfWDfGv
	 rAIBqw7BAZfvmGssx44uLC1oUn3eBHYXmQ2PTulrDCG7raJJtrJ/Oyzgs8xaf7/RB+hhr
	 /mFCZx7Q8WQ/9gwqI1KYbwM2uLy/yDXU8lUIFV7kCFFU0Y+32GbMsF4AN8kvEVelQWdoi
	 Ml3ibBUnZSdjyFPDvr68dWK0ceOi4k67WseZWMCWCHaYBz+rHdaFitt6KV3h6UQbkVWA5
	 KHxiC5f0E6a6RuQl5cHzSb++Wzbzg9v1ebKvubXeOyxXEXSnSFSpUT0jWQ22l+IbUcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s8FH5I2E;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13DA606A31A
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 19:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E13DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s8FH5I2E
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a9e87ba7f2so298601fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 12:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695779; x=1793300579; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7dOAuB9XyFaeFfFVegEDpoF2gtsk0VyOm+nWLSWg1aM=;
        b=s8FH5I2EgJjB9VRCz7xohCArmiWpUXjZD8X3YS6Sbf5E2W2ecLSG2JRKmVqWjoXV/1
         Q9nBxgeEPnRzza6iDE0ocwcalHHyuIcDqk0+px/JOoZx63+6JUfMhmZ/55z0nrqnyT9k
         b1Aqi1/Xjmm5kOFLHxTA5tBiQDYqGU7jpzGCmk4UhJWbaJAIGLdmcPR6e/qhchUl6RAK
         umIwHN9zS9uMq1sEH1dkl8IfzV91se4dl9l3YBFcj8NB5d1LckQxKT5Y4g/xMocKs9El
         sz2b8L1btsVbxuIxidY7vvej2blwlM9Cu2BdnVy2K/E0lXW6sPN+GV9XrVzrpkdqXGZt
         Bs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695779; x=1793300579;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dOAuB9XyFaeFfFVegEDpoF2gtsk0VyOm+nWLSWg1aM=;
        b=VXcYHAucHY4tZkzwREnag6XblOAG+1mLfduuJzlbs1xYRyFr9mnCPqL+jdIrI4ucRA
         mgJVM0YYbzVFp4zL1S8Hhbsvi+Ssb0SLGTQOS1TuJmvLOFTXz8/c2h8uQ759x3oxcWCF
         38kwCSH09q2wjylOvKPtL/a5oXU3gG9N7T+dfNo6/Gkmb4AWtT1X/DhqEVDEVdFEQ1Z7
         qFyT4UsJBhfqCJrY1wHhyfN9mH53IYjui63xPI9DfUec0N9HTqjaCDm/YP8uVFAkD8GK
         8cG02PUfdOW2xrnPGa/An5XQ7Sy092IXGcDdV5rgbBuVmKTVQOaPa8F7z9sU3luV74Og
         5EMQ==
X-Forwarded-Encrypted: i=1; AKwUvByG6v5H4wb4VW1PIRkHsiU4r2d+BhlfOA0lwm2GDXI4STeyxqODTrdDA6E2sFI/G1wl2Wjh6dPBCOUWFg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKg9QHfTSMLT1gQ80mmA7CFnnaJ9rjoNJ42tOyOm8ZDx6/RBSb0
	frBPYfWCSEyy1ZQNMgtlVafrqMltdWbl7FlEjX8gQlWsQoXl4Havckuu
X-Gm-Gg: AYBFou38x0cNTXYV+jY7mYUXdftPBHb380kKw1U3BI0i0xXRyroe/Tmha4bqbnTxcFA
	42cN3MfP4Cl92zg60GkUOITQp6B6Mf+sifoCh5MURlKMZypdG3/3Ys/YuSSBldLEqugInqtSLBm
	ZnnHiHxntDueFCr35VDsMVHzlqdJjgx71OaGC69gax3LHZAYNaZ0RsvMRaVCXsiiQ5VXVO62NoV
	tBgeWmxyMRZ0OrgjSPAoSquGDwWmVnMS0GL6YRMMRpKikNYUHMechb4vRHR69ixR8wcMgTDkVXH
	WLw3pDXT06oJWOA/EWZn7J6anXHogZYVdRL2WAvp7dEMuCNauN4Wl0IWXFjaBbd/hOPSEqu2mcd
	mV/jh+94XRxcRNPIKD7yrAWXMFr3YCfhIV5p/qRxxavbRGK5xR1fsd7YPBEuvyX1eLvkYg7SAdC
	+i++ATPwUgi027Ts2CPy7S8iqPkVIPUwCGcfSn1vDnHPz/EpbN7/liN3+Rjii1utUQJcSF06C/J
	qaeqxYTRGZ40R4qEWC0Uaobcizz6l77ZwyE2RyHMJmlmthqHTSkO6fcff6o5sQ7BZDgZAbqKQTU
	ash5GfcLsRPIm2z0DTfqXCvuNcqgx88ybCbw5dQ=
X-Received: by 2002:a2e:a54c:0:b0:3ab:28cd:f612 with SMTP id 38308e7fff4ca-3ac4409fd78mr17450261fa.1.1792695778803;
        Thu, 22 Oct 2026 12:02:58 -0700 (PDT)
Received: from ik5070.localdomain (82-131-69-225.ip.elisa.ee. [82.131.69.225])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-3ac65cff1e0sm99901fa.20.2026.10.22.12.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:02:58 -0700 (PDT)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Indrek Kruusa <indrek.kruusa@gmail.com>
Subject: Re: [PATCH 0/3] hwspinlock: sun6i: Allwinner D1 and T113 support
Date: Thu, 22 Oct 2026 22:01:15 +0300
Message-ID: <20261022190203.1998156-1-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I managed to run this patch series on a Sipeed Lichee RV Dock (Allwinner D1),
in this setup:

  - FreeRTOS on the HiFi4 DSP, running a task that contends for the lock
  - a test kernel module touching the same shared memory, with and without
    taking the lock

The series is applied on top of v7.3-rc7.

What I ran:

  - probe: 3005000.hwlock binds and the driver reports 32 locks

  - mutual exclusion: lock 0, taken alternately by the C906 and the HiFi4.
    Each side added 1 to a shared counter under the lock, 1,000,000 times:

      counter=2000000 expected=2000000 -> EXACT
      tripwire linux=0 dsp=0 -> no overlap

    A tripwire field is set while inside the critical section and read by the
    other side, so overlap is caught independently of the counter.

  - negative control, identical loop with the lock not taken:

      counter=1885761 expected=2000000 -> LOST UPDATES   (5.7% lost)
      tripwire linux=100302 dsp=674915 -> OVERLAP DETECTED

The loss rate in the negative control varies between runs (5-19% observed);
the log linked below is one sample.

Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>

I put this test setup together with AI assistance. Sources, build
instructions, ready-to-use images (DSP firmware included) for the RV Dock
and for the Nezha (untested), and the captured console logs are here:

  https://github.com/ikruusa/d1-hwspinlock-test

Greetings,
Indrek
