Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AB23A872D
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Oct 2026 19:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488864; cv=none; b=tmYOWrL3I2M1xXQAWHO9ed5eV3hRcbBSLBkkhAofT4P6sTaOE+k8Sl1HNpPBn2bs0miy9EXUdcvv0f3zeBQHvBy0s7Z/ARowPwDUUx1CvmOwJ70TGl3u5oy9cnWXdDe64VycDeD7qo8ZCDooC19fl2rxC5kNV+eBDuNwdP/U01Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488864; c=relaxed/simple;
	bh=6X2t7eJ5QBcElQzrzDWM1Xhhl94ovrcRm6oVdNZYXAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+36XW6yBxm7RdDNtLrug3bt9PvGL4IwEYSSihENsr07XBRIjVBg0YjiKuPU7P8rolXfkPbEC3qPVeG0SKlawRG9fcyvZ15QPdOPGALS7sFImSeBFFE+CPhV8bzV1P46JHhPs8IcTEm08YxUeBL+EQO4zxFtbj/wpajXHumsn40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZVae0fc; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZVae0fc"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33c2520ad38so8132843eec.1
        for <linux-sunxi@lists.linux.dev>; Thu, 08 Oct 2026 12:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488862; x=1792093662; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6X2t7eJ5QBcElQzrzDWM1Xhhl94ovrcRm6oVdNZYXAg=;
        b=bZVae0fcXSN1nzfA/pFsLCmvpaZS9WFiVrc6q068YBgbYOyGC7890z9lAo6A5FnjJU
         tf7VZ8ysyyxQT7T43J8yOTVxyGqjLS8ki9j4GX7yxwMUlYXdVs9XPQSw+2NBEQPqLBbA
         QT9Az0rIEmX7iEwID+K839QZZ6Cw4ekHe8IkVDvgmGao4egGaOYDqpAnvNl47RYX6ZK9
         vW4Vya30w0fWllkoM7Msi4oCshW0b0kYd8kXbwaazFa0jYtKIKeRKqzrVFwu/CtpKzK9
         X7zTGBZJ/EAn9OBduste+kzoGTc0jh4i49HZLd558im7iu1Ejqs/SiY+tHL6Nh7CiR8Y
         NjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488862; x=1792093662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6X2t7eJ5QBcElQzrzDWM1Xhhl94ovrcRm6oVdNZYXAg=;
        b=VLL8lTCuZKtOEbHgPhTxyOVto4s24qSX16NTro8TkuxZj8EsNBsCJ54cCAupMS8C7M
         1J0SLjgvaocULdVA4gwQQaTWZxQiApHhhxDsVfseCv8lFjtZ5PeBrH6p9CKvKPPnxv7D
         ojq4/JJ75I6xBiAKAzU0kU/PTclRlgCB30GKdlYhf/3kqPtu1HplsSevX6Z/Ki7BAojQ
         rRhxcnQXc882A5hxeOGROsjrTAGbCAPpVYq4zBau+YDZAN2Uk+VeQuBnd832R6b+rNgC
         u6WHZxCLd3k30Nn9gLz4MspSTVd4VJ+6k7Po6p33N1cl6nGhNtR3oKo01kqHVEinUqBq
         dGrQ==
X-Forwarded-Encrypted: i=1; AKwUvByKN7X6U9XPAJfjsBMLvKfef46FljUgYNMVf9zzr4WB5sulD02iCH6tIAktWpOtVbk6FBW8O4iBnfAKmw==@lists.linux.dev
X-Gm-Message-State: AFq9FYK9hn/fS1kOAH1lOXgAD4YaDnp0gdthxnSmxmsPCiuY5CooOnw0
	qar2KLS1oe+jNFilG3ntwXPR0NwcWYcSLYGfM4WvqH8oxzV8pRp63vaE
X-Gm-Gg: AYBFou1UdjtqdjQlxshbZTkn8YRz5WCrnDrntYFRuYyDhLQOPh60M6O20/AHhM1L4EU
	ysWBTRmrkLBpjQ5+JADvjguPgHMUQzk4X2iu4cLt2G5uboOzqms3uhWfKfCXgJ2k6oZFMrV8yvt
	qj06WoVzDzn501nIEUKxPcQuINR8edISzKMJ3owljfJ8vKUTjzLKgAXRWnA+EG6w7QuQIAwFkXs
	KFmEuhp0OW2hXYqVHy3Y5I+FEHKH/p4AEh2s8uVGr6KWh/eS0SjSO6Y4XolN05soxYVFAuywjUw
	iFL5dxEwGP+xc/oKWThT1G+UHPn6GyLtFaqrRiZ7LTXEMJiU0bUcIoHbSLWug+8nBxjwscPi9S8
	R2tZVNIF1zAd0EoN9u2g2f4d5kbNoKd2BoxY7Fz5x8WljWCwE3zXQxXokr9j3aHFRLByJo0IoSV
	E8L6/7Q55ASGycXUuBDOZTOk45srfz9fxJBfY+5TQhtA72zgOXMxGhTUDNrH7thdrxDhf8doqmB
	ECdHEVhyMiEzBm0nSOdHSv/hQgS5QYIJA1KwZxYAgyUfPDolDtxr0/OF/iZ4B5wEogWE3yDQlSh
	u+Ly9g==
X-Received: by 2002:a05:7301:580b:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-3517ec1b4d7mr4689953eec.28.1791488861717;
        Thu, 08 Oct 2026 12:47:41 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm291906eec.9.2026.10.08.12.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:47:40 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/7] pinctrl: sunxi: Add Allwinner A733 support
Date: Thu,  8 Oct 2026 16:47:19 -0300
Message-ID: <20261008194719.328146-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133519.459011-1-andre.przywara@arm.com>
References: <20260910133519.459011-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre,

While bringing up the Radxa Cubie A7Z on mainline, I went through the
A733 io-bias code against the user manual (v0.92). The register layout
doesn't match, on both controllers.

On the main PIO, GPIO_POW_MOD_SEL (0x040) has two-bit fields per supply
domain: PF is bits 11:10, PK is 21:20, and PB falls under the VCC-IO
field at 25:24. sunxi_pinctrl_set_io_bias_cfg() treats it as one bit
per bank, so a PF request writes bit 5 (inside the PC field) and a PK
request writes bit 10, the low bit of PF.

The R-PIO has the same layout, PL at 1:0 and PM at 3:2. The a733-r
compatible shares the A523-R descriptor, so it also gets the inverted
encoding and the RMW at 0x344, which the A733 manual doesn't list.

PL is the case I like least. Running the unmodified helper on the host
with the R-PIO state I read on my board (SEL 0x000aaaaa, 0x344 = 0) and
a 3.3 V vcc-pl supply, SEL becomes 0x000aaaab. Per the manual table PL
goes from 10 (fixed 3.3 V) to 11 (fixed 1.8 V). I haven't run that
path on the board. With no A733 board DT upstream yet, I don't think
anyone hits it today.

Locally I set BIAS_VOLTAGE_NONE for the A733 and gave the A733-R its
own descriptor with NONE, leaving A523/A523-R as they are. That's
roughly what the vendor BSP does too: its kernel never programs these
registers and keeps the firmware setup (all auto on the main PIO here,
PL/PM fixed at 3.3 V).

Tested on one board (the vendor kernel reports SoC version B),
RAM-booted over FEL, with your pinctrl patches on an integration tree
and fixed regulators for the 3.3 V PB and PM supplies. With a few
printks I checked that UART0 (PB9) and a gpio-led on PM2 reach the
helper on the first request of their bank and that SEL and SEL+4 stay
unchanged. Same registers without the printks, and UART and the LED
work. A523 is build-tested only.

Would you be OK with disabling the io-bias programming for A733/A733-R
as a fix for now, and doing proper voltage mode support later? If so
I'll send the two patches, with Fixes: tags for 0535bfbfa97b and
31d68e10381c.

Thanks,
Vinicius
