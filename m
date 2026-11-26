Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707487;
	b=At/7RUztUDwjVf/xV/IOPtQGczPvK6NgA9pWVU9QNhE3vBtE8EIK6It9wMdbwHr1kKpg
	 C4D5mx9ezqO5I1PGaZhug7rL6zxOOcS7zsMDHSKs7PtW1todCKLQhZpxMQpi1cYb8BmhQ
	 X/6ZKffrcs6ujSR2nbEQECgugUz9mhv4LqCrjf6OgynHQuFMFb4sBtOCh1l3QF0ONHAc8
	 r2HQ1enpCvs9RPC1/SKnuE5ZJCtK19HX8EAuyyfOBjWSfSTpmXf6AnglQOn4DMmdDgCwu
	 Gk1zrYglxemDdZkU3lTj4VnHEpFBKQ8lJ5dC6n7aIoLKq72iYXb84FLcn/lvDllAGSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707487;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=aFjQaGnUmlptpLWffrEp74iYT+06fQSQqhzB/0NW3O8=;
	b=uUhU2H7MOl75QWBJpTtPVEU/eub2ZHNtiOsSVuhrYf1F89ENn2sQvtThBu+tvWRRqh3x
	 f1mOXTAm0joX8hBsEpKG9zc6LenNdsZIMkikAf/DipPetGV1OCltASfq6UQ6LABitcJ/b
	 XryWjVRPfh7rcP/x8hhtVd6qd9UTm/ALoHuwSB8WdJ2SQChvolUE66B6cPXjJjcP+8GyT
	 Q0zEhQ6EOrDyWSlKVibS/ZnO1+kI2YUSB0UlTKqgb+kfeTs3i3HbuuHQanuaC2uTmA44B
	 Hnwb3q25Cc72OujBChXVUMXHNo97WK39BN/HpinKHK8ztYP3otLhdQmnMrhl2y6NZmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=rftm64vbdza77cgdpmci2epy6u.protonmail2 header.b=nWH6KR50;
	arc=none smtp.remote-ip=79.135.106.120
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72EE606A32A
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 15:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E72EE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=rftm64vbdza77cgdpmci2epy6u.protonmail2 header.b=nWH6KR50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=rftm64vbdza77cgdpmci2epy6u.protonmail2; t=1795707484;
	x=1795966684; bh=aFjQaGnUmlptpLWffrEp74iYT+06fQSQqhzB/0NW3O8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nWH6KR505JdzmQabJo+ECr4pwDXVoLh36SWJZwzBDJY6Hu3IjjfoUwtUc88w0UWbQ
	 5bbcDPTYeqhurqiRM6rN3fvyH7FcMqWZ9BlI7iesxuUr2LoHdzpPW25iBiwtyhe2BV
	 I7L0Edvp6bdF8mDFDgNIeSLwOpSO4UMNcvlbljeW+ihHoJWVFaIIldnqb5WuqjE50Y
	 0PopXIlUuaMERP8mSciumoQlp2h9opqH1s9+fbiG4CvI5/VIJrj9ww8kQWqWOrWZ4F
	 LJfaWJ1cG5BIVQpF8xjJK/94z5To9ZBG2HWSnZs5WhndzymNc7JEklzLtUaZnrEEVw
	 jCBp8npHBvFZw==
Date: Thu, 26 Nov 2026 15:37:59 +0000
To: Enzo Adriano <enzo.adriano.code@gmail.com>
From: Norman Herms <dockseed@proton.me>
Cc: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v5 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Message-ID: <CqGMQaDysL6l016qtEM8oOEnYUMKACgmwLUbb0wruVAzPcwiqrz00WCOhTrhkVEaZt1YB3xfucXdEc-ZFi-sCPgn69RNqtW0v4Gn_HjQZXs=@proton.me>
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 8075a9d6fe42b37f7ffdcbe99ce72b6c0920a791
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Enzo,

Tested on a Radxa Cubie A7S: sunxi/for-next 2ba07dfcd45b plus the five
dependencies from your cover letter ([2] as the RESEND v3), no other
patches. Own boot firmware (U-Boot SPL with the vendor DRAM init,
TF-A, U-Boot), not the vendor's. The DTB has one extra 2 MiB
reserved-memory region for a bad DRAM area on this board.

Our U-Boot starts the watchdog at 0x7021000 (16 s). The DT has no
watchdog node, so the board reset after 16 s until I stopped it in
U-Boot.

- PMIC: all bounded rails are within their bounds, and the PMIC
  registers read the same as under our 6.18 kernel.
- PMU: A55 PMU on CPUs 0-5, A76 PMU on 6-7. Counting and overflow
  interrupts (PPI 7) work on all 8 CPUs.
- MMC0: High Speed, 50 MHz, 3.3 V. Repeated reads and a 64 MiB
  write/readback matched. PF6 reports the card as present.
- EEPROM reads, both LEDs switch visibly, and warm reboot and
  power-off work. No warnings in dmesg.

Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)

Not tested: EEPROM writes, card hotplug, 1.8 V switching, the PMIC
interrupt, EL2, ITS/MSI, suspend, rail voltages at the pins. Built
and measured by AI agents (Claude) on my board.

Thanks,
Norman
