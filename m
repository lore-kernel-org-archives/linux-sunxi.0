Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48742202992
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742732674; cv=none; b=CjVBUGsdiIS5WIEIxivF+sc2/f9qQMAlAEUz+2y+ESL7Kv831Ih9zhnGlF3DQi4Duqfl2llccJI4KO7DUNwb6fjFbPUySU+kfKheQnzjlFw27cWjDW0vImABH9mB4Fx69hYNEevc4aHnxg9QUFilNH90ucrYWAXjknHYb4yTe0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742732674; c=relaxed/simple;
	bh=7WKedpt+nbSJdiAUIIEItsLaY/TMOfqYHyNYzHlG8xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pd5co5lxxYYClUUZg8eeqnODzff6+5pOFBAYK9iYz/yYiXLwcynkaSbXMDf8ss8hY+rDCV04q2h16KeazUWLOBK7eWTTz6oYivpjEKhoh4YI6d9a2Q3N8AzNSOl2KyoJui7pmU6wN84RXhcmjjHusgt7M614JjBNDjFCKEsrTDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0Rt+C+E; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0Rt+C+E"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394a823036so35107195e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 05:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742732672; x=1743337472; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WKedpt+nbSJdiAUIIEItsLaY/TMOfqYHyNYzHlG8xw=;
        b=D0Rt+C+E2IA8iCB1sj1kIDXJxBQzKImdzfdEiSQmuSAl1Wdg65K4yArWcnKCuotCKJ
         ofxcRaZsJi8cMO7hwgfVr7+I6k93hOUXp07PcUwvsYDkTEIbcP06MRyK97cas2km9AQf
         bcgy594lKSBdsplc8SXygrsuZRV279NnTo3b7/BVqXTIZDGpmCXcM76ZL2n3TfyD/8Hf
         PBW2xzAvwiOanLLO6k66HfRVYIgIfZJNixRuYphR2aFbd4TpUSUkIGkFTiSoWg0+RvL7
         lkbgXhFR0t6rmjce5LwGavcu/xaG7LLamGxd/JZRIIt8znTnEkhuwz3bHW0ueXbzxedm
         383Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742732672; x=1743337472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WKedpt+nbSJdiAUIIEItsLaY/TMOfqYHyNYzHlG8xw=;
        b=ILdE1Imu2FpYjTVeR9MKvgnxAyLplmPAyDSdKmIS75BvvN/CBjTq/xBnpsup1Lmxjh
         mCxiGsfU82SG96KClupZ4LbmGQGW7rnztpWfHGJpHOgJofXKhMgzCTbVDJokGTrznFwd
         ZBP7CKN+1MSOOAQG8oQegWNE/euzdcCjAE0FVIcpdFT1/ne7XXA4u5MlSkoo7dYQQ6zx
         sBRDkg+bBRGmM6mX6I2eMIVFQ9AmTct+Ul3SnH7bjPl9ZOkQ/QhQ99l+mOg9nUUnCqUY
         rIj1OblrG/Qqy7yQ1P3Undq/Qgj7kI3y5bmuEo4F+VMP4WZg6WeNfxT1CL3HZZA9YakQ
         EhNw==
X-Forwarded-Encrypted: i=1; AJvYcCWOA/mEDkTdo708SLycjcZ4Uscv3MNZA5FRQomZ7nvYPo1l0xJkWyrwteSaqqNGvjCCVdbdWHFyUzgLLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOqzqccVGzMH5tZxCvP2uYoQB+MzXxOOVQtwf8PjZWrZBve31n
	hfaxZJpNsaJA9WjPn3kvQt0XIqcQvor712BMWMnVap4+iLk5877n
X-Gm-Gg: ASbGnctvvV4DNgFpANCq9YocXeUHHAkPKMQID5w0YGhGUALcbwjbSXE/PYjOowvJ8Qa
	YHUS71hnO418x6u3XQ9HOItNrm+nuHlPDbc98QAFYwJsFrsdxDkaDaF8ONWYVjYIkPI6p3IrOG5
	gxrpz1ric6XyKByt/qLPcoWlIqvo9aYIN/DNMkcESxAQLyI6t8nsE9vevR+crdV+kQv35maq5bc
	JR+oj9X4K7SSlnR9rm3tlvV+CjEO8OyamUxrPx4ASLDAXMSIJuo+RluejF/CFr72tWTjCWuhgNS
	V+R+FPiHKYwEksiQ3DH4rtHwU3pi8uBEvV70t3jzBWxndlPVnGGHJOkQqX/jjW5CHRBmdBXOUbU
	2qncdDNCvvU2omfJIaH/a
X-Google-Smtp-Source: AGHT+IHUeBCLlLJMZAjq3aT9ayZR4JRvWJHk95k8mdakfG6ANtmZvQ4VWGbUZQZ6UEoVwjXgloRp+w==
X-Received: by 2002:a5d:584b:0:b0:390:f9a5:bd79 with SMTP id ffacd0b85a97d-3997f90ab9emr8989878f8f.26.1742732671471;
        Sun, 23 Mar 2025 05:24:31 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e65e0sm7774811f8f.61.2025.03.23.05.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 05:24:31 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Mikhail Kalashnikov <iuncuim@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 26/34] sunxi: update rmr_switch.S source code
Date: Sun, 23 Mar 2025 13:24:30 +0100
Message-ID: <9421768.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20250323113544.7933-27-andre.przywara@arm.com>
References:
 <20250323113544.7933-1-andre.przywara@arm.com>
 <20250323113544.7933-27-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 23. marec 2025 ob 12:35:36 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> Because the Allwinner BootROM always runs in AArch32, even on ARMv8 SoCs,
> we need to switch to AArch64 first, but also need to save the CPU state,
> when we later may need to return to the BootROM, for continuing with the
> FEL USB protocol. This is done in 32-bit code, which we include into the
> AArch64 boot assembly file as a series of .word directives, containing
> the encoded AArch32 instructions. To be able to change and verify that
> code, we also kept an assembly file with the respective 32-bit code, but
> just for reference.
>=20
> As this code is never compiled or assembled - it's just for
> documentation - it became stale over time: we didn't really update this
> along with the changes we made to the boot code. In particular the FEL
> save code was completely missing.
>=20
> Update that 32-bit assembly file, to match the current version used in
> boot0.h, including the FEL save routine. Also update the build
> instructions in the comments, to give people an actual chance to
> assemble this code.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


