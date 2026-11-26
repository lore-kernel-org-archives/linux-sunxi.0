Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.120
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795664301;
	b=v0gop1C42Jp1ZLQfVZEl7EAaBCErQKB+ThOyo3w6qTWhHbR00d3HuSNqQQZW8tGNR92H
	 bEBZVDdxkm+XdfrOqkaIahxpXFrvWvw/SNOGrztY3UqPQvA+TG6enMrVeKL8qwSC8BAkl
	 jBQpdlQ96U8t69HDut9CjSufPQHfSn+nOCMgGMrCUrFXBlACqyhn4Up+2U0WMKRLANyLa
	 LuLYkFDCC22kgyFKrl7fxKc01rxSbq24E/HObubIeRJvcwKGVY4ZCUONnNBT0Zn3SQ/lr
	 qi7Jdm7JioKspzq8fwQDSEXDiQKeAlnWMoIF9o6QQPkj5vjt4Q1ZfQ/M/CC/LBgd+HQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795664301;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ZohoMailClient;
	bh=4FiZB15xhKIOJGy2ZwbI3s6k8WVaPRsBBgY+WA+DbhU=;
	b=DiO6eH0Yqu67vWSi/y2NDM4L+bBGKcuRQzeq36veOUNoZpuGZZ4L7gpOjqGNnDhM3I7x
	 c2QXDIAeDJ0uDGWQJJOTDSozDgKP8XsYJAYSiuGtswkxAX1WGRFcS5ySOX2nor/c5dIcD
	 7JQPqJKKJEfQ5Yj47ASSF5W3TMrZ8p7jE4S/Cwmerw1TwGoYZ2VIMhgIwn8uQMj8t2p1N
	 BTuKRJlpVV8ipE1XlHjn3SAok81WtAnapXdwgu0DZysaeA9ItTYZyLF2MYBcGJpIa/bSb
	 3g9ssUjjr3WyiFVNAb69m5qAVbq2FHEV/v9HARPLiygDoLQrKGfqaflunmxsUFfXHJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pigmoral.tech;
	spf=pass smtp.mailfrom=pigmoral.tech;
	dkim=pass header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=EQ9IfgrN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.120
Received: from sender6-pp-g120.zoho.com (sender6-pp-g120.zoho.com [165.173.180.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B60606A31E
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 03:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B60606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=EQ9IfgrN
ARC-Seal: i=1; a=rsa-sha256; t=1795664266; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DCST9ByL27Upx2hl0RzcqKcwt9Z7EVBalVed5KTX5p0dqKgovEq5o1KKe0YRBS+WcivtXbO2HcSsag7nrcXRTvRkdF4ReXXxt9iz1s9PoVOFQmi11LbzT9r9B/kIjmriAHMWtZhI0m0IKdtNWOgQqyyY7Juu1hLpt/ZwF3YvN7A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795664266; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4FiZB15xhKIOJGy2ZwbI3s6k8WVaPRsBBgY+WA+DbhU=; 
	b=lf8eHZZofR8MSZAryQsfxNMzo5nZCqRPrbimNdazOKSxaVgEnEWR/uLPY3JABWWMxEx00UTdHuMZsxS+SSV4W6jOFX1Pi4Acpks+U4XjEI1LxRRFyOdmOv9gBhq8shkdbZAH5IRd82yXsBpFzdPm5yALBN6RiHDsEb5EArE4SAE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: a=rsa-sha256; b=EQ9IfgrNgxR+Fh8LE3AvioVr5xbMX20L/NC1Z/s6ccpmAAcOkqIZk9M8kr1WRakP3rPB+5QW3B8Um0A1PiQPrZg5YshCazvMMtRztBSlhCuqO5kYenDFYKWtlDV8c8ZnJ9wfsjd94X0fu1WcsaTvBvnW5SygE1tQv93AXACAkOg=; c=relaxed/relaxed; s=zmail; d=pigmoral.tech; v=1; bh=4FiZB15xhKIOJGy2ZwbI3s6k8WVaPRsBBgY+WA+DbhU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795664265088521.0475713937745;
	Wed, 25 Nov 2026 19:37:45 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 11:37:34 +0800
Message-Id: <DN4TUQIL3J9N.XYYN5MTODT2C@pigmoral.tech>
Cc: <linux-clk@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Andre Przywara" <andre.przywara@arm.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Enzo Adriano"
 <enzo.adriano.code@gmail.com>, "Norman Herms" <dockseed@proton.me>,
 "Vinicius Pedrosa" <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v7 4/8] clk: sunxi-ng: a733: Add PLL clocks support
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Alastair D'Silva" <alastair@d-silva.org>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>, "Stephen Boyd" <sboyd@kernel.org>, "Brian
 Masney" <bmasney+clk@redhat.com>, "Jerome Brunet"
 <jbrunet+clk@baylibre.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland"
 <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Richard Cochran"
 <richardcochran@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261112-a733-clk-v7-4-db7c5451ffa2@pigmoral.tech>
 <20261125122452.3966873-1-alastair@d-silva.org>
In-Reply-To: <20261125122452.3966873-1-alastair@d-silva.org>
X-ZohoMailClient: External

Hi Alastair,

On Wed Nov 25, 2026 at 8:24 PM CST, Alastair D'Silva wrote:
> Hi Junhui,
>
> On Thu, 12 Nov 2026, Junhui Liu wrote:
>> static struct ccu_nkmp pll_ref_clk =3D {
>> ...
>> };
>> ...
>> static CLK_FIXED_FACTOR_HWS(sys_24M_clk, "sys-24M", pll_ref_hws, 1, 1, 0=
);
>
> While testing this v7 series on the OrangePi 4 Pro (24 MHz HOSC), ttyS0

Before ordering an Orange Pi 4 Pro to investigate this, I checked its
schematic, "OPI 4 PRO V1_3_2_20260109.pdf". Y1 is marked
"26M-20pF-10ppm", with a "USE 26M" note, and the CK-SEL resistors are
configured for 26 MHz.

Could you double check the crystal frequency on your board?

> switches from earlycon to garbled output with:
>
>   2500000.serial: ttyS0 MMIO32:0x0000000002500000 (irq =3D 414, base_baud=
 =3D 1384615) is a 16550A
>
> Because the hardware bypasses pll-ref (0x02002000) when HOSC is 24 MHz,
> sys-24M physically runs at 24 MHz from HOSC, while pll-ref remains
> disabled with reset/unprogrammed N=3D12, M=3D13 fields. Since
> ccu_nkmp_ops.recalc_rate() computes parent_rate * N / M regardless of
> the enable bit, pll-ref reports 24000000 * 12 / 13 =3D 22153846 Hz.

I also noticed that your DTS in your U-Boot patch sets sets the
oscillator frequency to 24 MHz. If the board actually uses a 26 MHz
crystal, but the DTB used by Linux declares 24 MHz, the PLL_REF N/M
ratio of 12/13 would give:

  Actual:   26000000 * 12 / 13 =3D 24000000 Hz
  Reported: 24000000 * 12 / 13 =3D 22153846 Hz

This would also explain the reported rate and UART baud error.

Could you check the oscillator frequency in the DTB Linux is using and
share the raw values of PLL_REF_CTRL (0x02002000) and RTC_XO_CTRL0
(0x07090160)? That should help distinguish these possibilities.

>
> sys-24M, apb-uart, and bus-uart0 inherit 22153846 Hz instead of
> 24000000 Hz, so 8250_dw calculates base_baud =3D 1384615 (instead of
> 1500000) and programs divisor 12 instead of 13 (+8.3% baud error).
>
> If pll-ref is disabled/bypassed (or if sys-24M is physically fixed at
> 24 MHz as the comment describes), either pll_ref_clk needs a recalc_rate
> that returns 24 MHz when disabled/bypassed, or sys_24M_clk should not
> inherit an unenabled pll-ref N/M ratio.
>
> Tested on OrangePi 4 Pro (Allwinner A733).
>
> Thanks,
> Alastair

--=20
Best regards,
Junhui Liu

