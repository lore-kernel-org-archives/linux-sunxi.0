Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796243;
	b=dcs30ApZyVtp1isE/T12Z+GvnvXQLiF82/mtRUTDevvOIE7PO5ug/wO21pkQPybZI4b5
	 i0CBUL/tQnFHPiJIQFcAdCSQ6HbwI3lf93CrD9kw+tb7r4kSjXxu7KftevhbWKDzF4zL/
	 uPC14xokMC4MQ6gNiVO8XZqwHZ7F0tsymUyv6lw29pz2OJWTHaiDLLL1Ruzm7LQiYa5wH
	 HGkJCUrZMcojd5HNlZEvBxtJl03rAcRUTsrOaH3DI4G1dJkUVNmmXPguRgAoz0Pj/BCZ4
	 tCIOLv6rpjDnv0UBT3uomJYtvaW79TWo41KeskeIIVDPr/6VPLpgFX8Ir9DDJ15rtqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796243;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=/dzVLSTzAtZpIlTRksLK3iB4FqDeUyOeTiMZVSsykQw=;
	b=1Sdxd0ETOEn/PsN23LDOQqio2No/dD4olHvTT+9mYjF2fju/dzUn4b0T2ixpfoeo5aeg
	 VDkwbeaoUPCc/uQjEcdcur3IJLARzTDgAQKLV0x3sB/bKgBCTRfm9oGXVC+yn3+/AgS3c
	 v0Pjne6Qx5FjD3sasPSS2sVr24E4PzKKfkx23+ExXaArJsWUrVjOIw0Vto0P+HffzKGVN
	 VzqzIz0zdm1Nt9SbFF3cSHR8G+t4YUr2SAL6FL6wPWs92LQ5LIpsrg5cOAc6TwC5J6hA/
	 rc9f20yIoR7yWcqjUZKWOaHQBB5SEUTp4SW2ZDeJAGtPwPdFc3y+Vk7Dq0xdj3nNvkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=bw3+HFFy;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C886606A31C
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 16:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C886606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=bw3+HFFy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795796236; x=1796055436;
	bh=/dzVLSTzAtZpIlTRksLK3iB4FqDeUyOeTiMZVSsykQw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bw3+HFFyYQSibJAWqRVnLPlholNoMj9tEn3t2soACFMU2eyOHoBOwGWI/J9jRj7w/
	 SuWRdVrnbfegHXOIj2NPi8YSpMwdGzNpvSfkqKCpTu7a9NHfXQG+c6TY3AaFA/PZek
	 zO9FEn8O7MR1Gy82G3LDgzvtXoKO8YO5OnbSTWemOC1yC+WDCtpqRshHZtByTHn/dN
	 i+s7V+6z3sxAYmkdsO1bTo2PiQH+Yyj+vCKggv0MudNRzvPLTj0w8VFy/SsaUspiqg
	 WuV3tP6d4UFWNLjV586UWPJf2Itj4o//zCrPSfajSK9pARyKKJNU1FaU9Hejit0QfW
	 FkJbT6dR+YT4w==
Date: Fri, 27 Nov 2026 16:17:11 +0000
To: Andre Przywara <andre.przywara@arm.com>
From: Norman Herms <dockseed@proton.me>
Cc: Enzo Adriano <enzo.adriano.code@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>, Cristian Filipescu <filipescu.cristian@gmail.com>
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
Message-ID: <IUp5Ow8SUNdgtour7we7BN_rry0fuoBNw-ucfXERukfbwTWvoWo5QjYLXAzxftTjGnsuhCCnwvxZ5fBpL6pFPL62oTr2hZddgE6XmrQ76o0=@proton.me>
In-Reply-To: <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-3@gmail.com> <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 2bae6d665eabca9caaa9f917c67d0b69de98846a
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

Hi Andre,

On the ELDO1 question: the AXP318W datasheet (V1.0, Chinese, table
6-3) gives ELDO1 a default of 0.9 V and leaves it off at power-up, as it
does DCDC6 and DCDC7. So 1.075 V is not the PMIC default.

On the A7S we boot our own chain (U-Boot SPL calling the vendor DRAM
init, TF-A, U-Boot), and none of the open parts writes ELDO1. That
leaves the vendor DRAM init, which switches it on. Its value follows
VDD2H on the 25 mV grid: with DCDC7 at 1080 mV we read ELDO1 at
1075 mV, and with Radxa's own boot0 at 1120 mV we read 1100 mV.

We have also tried VDD2L at 0.9 V on the A7S. Lowering ELDO1 from
Linux changes the voltage after the DRAM training ran at 1.075 V,
which can lead to errors. So we keep the value the DRAM init leaves,
even though it does not match the schematic, as the v6 node without
voltage bounds does. The vendor DRAM init sets all the DRAM rails
itself, so a clean 0.9 V would have to come from there.

Built and measured by AI agents (Claude) on my board.

Thanks,
Norman
