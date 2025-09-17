Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D56266B67
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Sep 2025 20:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758139520; cv=none; b=IjP/qev9d9GXlN5n7eykyCQ3PhSmVVUpvlDOd5+sDfMf03cMUpNd/KKpwIvrK7oPkreeaeUlzaC3tu9R3+bQGErUz7KxQOZ+d+XT1SehRmnfQ3s6NJAfOSgktj2yGZkS9wYOlEeuxqwF03M8fwKOA0QKDdGtG6QtcLeQdtowlKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758139520; c=relaxed/simple;
	bh=kYZJ8XH9TpQR/GBBcTiu1HXEqK3YpLmRga9YsUpB1HY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ItAAGDmWN4nomfg4nLqeuJTmhtykUBpft4FPUOryEnr14vxSAMYRiacY/iqePxP6iajtMQk6zQA6IgKV2h7LDo1vsN4wkhAIoG/LU7BPP6mZmoC0PhLvsjkHiehzRGEM8Jpl5Y/J/v3IQGuo9UUw36t403dPX6PgQfTnW9ZAadM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EotmgKV1; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EotmgKV1"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-24456ce0b96so2830615ad.0
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Sep 2025 13:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758139518; x=1758744318; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=59LVzR+CfxMoH1jXVRwI+RBlyM8qRvPks1Fm/SLyr/c=;
        b=EotmgKV1Yo3KYa2C5FgSz/tKURBQ81EVlGJpJc7wAfOT0e2Zz5OMyrzUxFvu4uH4bj
         vsdDbc8Zv/F+aBTRL+uRjsuVHEyVwdjEij0DidNIYigbstiJeGStosfY263IhGRwjb5b
         0EGk+eaW4Sf4OkOK7+AXWX1ekmXkmfByeg06EzmmOHhJVaDyVskTVwlirC8vrYjJCJeb
         kYSWuQUfWIBRmqxQZSKTBnTkl9GslpycnkP6eMw0rl/hKtPnbk/J7RS3GZflCv6TAUic
         VCPLvD+ek6BaRWZdvHkHqBA5TwVzwd593mBYd7NRDCgjTcZfyuAw0EBff4iiWks6wJt8
         7VBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758139518; x=1758744318;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=59LVzR+CfxMoH1jXVRwI+RBlyM8qRvPks1Fm/SLyr/c=;
        b=eWRLvbTCQSvW/7A15FvkDMp8T2JfsNzML4SANcvplYGw/04WOCXegYwJWXwLTU80bP
         gzK9/PrFNaJmTq2S4wALaBuVQzIiluPhu7v8MDU1gbSYdzWAqaURdBxLlTRUFY+luK7v
         pqwtxZowoKDokcPeWBqtlm+VYMr2wIKYX6v19Cs7GuEJVgFLjuvDSYBmjEgyMV/5elbe
         sgjR0dQ/nLOj6jEasgURWPib0mouI3GoG0aq8Fen590yNiVqr0mUwxRi2g3A/Bvy/S35
         kJZK6twlCeKgCkpwi/X53Np8KRmYeJTYJrtNMhv02TomioUjORVKr3YeXeJ91dX+iCN2
         A5zA==
X-Gm-Message-State: AOJu0YxE5pybvats+YoN705H5oU2nzy7Wfrw3kXwPy5p5te4rfA3fXt/
	WY43PXPdOcvQxxsJj2P2GuMKlWmgP/20jXxD4fqVYI3Gvxu+oTATlPOvcpLa1Ws8i0Z6BxAN2Lf
	8BbSfi7XF6b8fzRs1exkBhu17RowBqxb2/L6n
X-Gm-Gg: ASbGncstbJTMdUTMfyrTbCNkHexnSVclashLJTGkvymmdE72qzoJTHwVEDLLxb0BthO
	hyDtFmgfMQMArL5r2OLJrlSnOBYX0ysxsvmLtUmcNrnmhdu0gV7Lz1pBRHHdqPCzk5fRQ1zzNhW
	96Fcg0OTlPzSk0450qc1onRVZ/Im+3w3UzIhY14mdtPGsvgHRKbGNsWLt+xKv4W8GL5ln6Jt5pe
	cNQuPhlzzggSvV/471GLqBHytKN/vz7sKN4xqJJS8T2nlkaqAFxNGdfHn/u5mUIUOv8
X-Google-Smtp-Source: AGHT+IElQCs19++P5pzmp+Y0ggYUxokMesCDC7Twem0Myex/imeqeLrf48U8yR0THAPLsS37P762kGrwv+HEG7+Pijk=
X-Received: by 2002:a17:902:eccc:b0:267:44e6:11d6 with SMTP id
 d9443c01a7336-2697c7f1808mr11496725ad.6.1758139517824; Wed, 17 Sep 2025
 13:05:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?Q?Horv=C3=A1th_Csaba?= <horvathcsabalaszlo@gmail.com>
Date: Wed, 17 Sep 2025 22:04:41 +0200
X-Gm-Features: AS18NWB-778AExZVxPs8UDI7Add0eVVHTdXizaOnLMqKZM2cY2--XyZQ-Dg8Avc
Message-ID: <CADGuG06ugs-jnUD+WZJ+Udgi-3-UdmfQDC27vsqZ+OFLiH_PRA@mail.gmail.com>
Subject: DTS fix/help needed
To: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I have posted about my Colorfly E708q1 tablet a while ago.
Since then, i identified that the power chip, AXP221 (as i know) may
be not correctly handled, maybe on DTS level.

The below messages are in my dmesg. So only dummy regulators were
created, and maybe this is the root cause why the cpufreq-dt cannot
adjust the CPU clock, and therefore the tablet is heating up at 1GHz
fixed clock. (If i try to change the frequency or the governor, the
device freezes.)

I used the .dtb file from the Sunxi guide for Colorfly (from the
U-Boot compilation step), but the resulting file is seemingly not
working. (I can attach or upload it somewhere. If i try to decompile
and recompile the .dts file, there are a lot of missing phandle
warnings.)
(Also the mainline kernel support is broken, as with a latest mainline
kernel, the built-in display is not working - with mainline 5.5 and
4.17 works, except the cpufreq-dt and power regulation.)

Can someone please help to get cpufreq and power adjustments working?

Cs.


[alarm@alarm ~]$ dmesg|grep "axp\|egulator"
[    2.036326] sun6i-a31-pinctrl 1c20800.pinctrl: 1c20800.pinctrl
supply vcc-pf not found, using dummy regulator
[    2.112666] sun6i-a31-pinctrl 1c20800.pinctrl: 1c20800.pinctrl
supply vcc-pa not found, using dummy regulator
[    2.120124] sun6i-a31-r-pinctrl 1f02c00.pinctrl: 1f02c00.pinctrl
supply vcc-pl not found, using dummy regulator
[    2.121215] axp20x-i2c 0-0068: AXP20x variant AXP221 found
[    2.130814] dcdc1: supplied by regulator-dummy
[    2.132268] dcdc2: supplied by regulator-dummy
[    2.133096] dcdc3: supplied by regulator-dummy
[    2.133944] dcdc4: supplied by regulator-dummy
[    2.134775] dcdc5: supplied by regulator-dummy
[    2.136735] aldo1: supplied by regulator-dummy
[    2.137592] aldo2: supplied by regulator-dummy
[    2.138423] aldo3: supplied by regulator-dummy
[    2.139814] eldo1: supplied by regulator-dummy
[    2.140663] eldo2: supplied by regulator-dummy
[    2.141502] eldo3: supplied by regulator-dummy
[    2.142346] dldo1: supplied by regulator-dummy
[    2.143187] dldo2: supplied by regulator-dummy
[    2.145191] dldo3: supplied by regulator-dummy
[    2.146038] dldo4: supplied by regulator-dummy
[    2.146904] rtc_ldo: supplied by regulator-dummy
[    2.147221] ldo_io0: supplied by regulator-dummy
[    2.148034] ldo_io1: supplied by regulator-dummy
[    2.151870] axp20x-usb-power-supply axp20x-usb-power-supply: DMA mask not set
[    2.164889] axp20x-i2c 0-0068: AXP20X driver loaded
[    2.167651] sun6i-a31-pinctrl 1c20800.pinctrl: 1c20800.pinctrl
supply vcc-pf not found, using dummy regulator
[    2.168606] sun6i-a31-pinctrl 1c20800.pinctrl: 1c20800.pinctrl
supply vcc-pa not found, using dummy regulator
[    2.229315] usb_phy_generic usb_phy_generic.1.auto:
usb_phy_generic.1.auto supply vcc not found, using dummy regulator
[   10.559063] input: axp20x-pek as
/devices/platform/soc/1f03400.i2c/i2c-0/0-0068/axp221-pek/input/input1
[   10.695614] axp20x-adc axp22x-adc: DMA mask not set

Cs.
