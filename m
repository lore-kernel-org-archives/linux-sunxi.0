Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4454D2E093A
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 15:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927470; cv=none; b=hVh5+sjjBejI3plZ97O+DVj7EgdLChbTTFuOLEj+balHw1VGw5PZ8QBsyBzV3vgwcTmOO9PHX15XA9ZL34uzhn7mz2Pdf3bmi+xyCzfL+84kkJ0Us3e3mZ1tZ/PhutoM5F3L5vEwCZTCGkCa450hr8rv+TF54x4N6UezyAlS5z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927470; c=relaxed/simple;
	bh=kBSdZxNyUBXnGPEWcHFMJ4x7qnQe6H8emesfsRdXpyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KpIruvH5/v68/zq5dW4Zxynm/m634hfjLhV8Paaj+8xrDHKsJF+vPo+ggvBcBlJBmFLNuJYLFcc2krYuHXtdk0FImlnsJfo+RAr+LKPmVEfbPbRhyCzUhAwhDo0mIUh0O5O+JJBPQhaAbvXmr6IXsGCKWkhTNgwS6jSIDcjGnmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dq2t4raQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dq2t4raQ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b783d851e6so3864776f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 08:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927466; x=1755532266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFlIpcxIhb8jIwr3aESzJkFzlO4zyyqAODuwsxdMWSQ=;
        b=dq2t4raQ82UxWimt1vO33OrgqKKqlfCRzel5DF6G1Tulbt1Stepbn5jrQWidHRt3b9
         65LFIjjvfIs7WnchfptfcQ/c/Y0luxLguSbMQ0vG9gR5IYQHpKx6NByGzmcuHQQ5QQo3
         EeBJYenU9ijtrf1MuqyB77zOiUpJtsLLjhd2w7xgEO5kK5byjZcqu8uOeGogXevrYtlo
         sc05YkcEFIL2MNBFQujHD/G08LozuUBPlfvzsmdtKxmFACr7RpFeYaPz3XwapW1v3sBU
         S6uTNywk82XCd0MKTPmlLd4b/XJ0hB5o+R87yHo+UGCFf3lyFbjMwQO3/Kc/zxRfSORQ
         OZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927466; x=1755532266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFlIpcxIhb8jIwr3aESzJkFzlO4zyyqAODuwsxdMWSQ=;
        b=S3VX96cL71dUFC+jMsZFIbcaltu8pchx4gkEII+tkUHzJUP5QUSq22j6UU7RQc5uH8
         H7QbfyQFtwn646YMhxFz3n7XT3IHBt9x7cjs5zZ/ref5m5uBdOhhBfrB3wtRcKcH8R8o
         v0uC9oBNTD7C6DtVup/ZPZmNBlS8KkLFFK0lAudB8asmvcSvWgoSTAJVSUJGxqgcIci8
         Jh7bQkf27jfNrd/mgpixXUF65hrqa50KT+fjCB2Mw6qeRbLfJDRpK2Om5iJpPQhLVo4x
         aOxVACUMq++330FU4VSRXiFIsmjNCXazeuCOAAlXzAWFqYHnq8n3WYq1ZraWgzZW2k9o
         zGsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuGQ/8REk7QWHe6fa7yzq/sfUwpxIRtjmIW2Dw1M2ZjjhXan9CeoJ2y+qnGulShDLOrULRaLPhlgUdRw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl/CHNX4988rTdbz3WO7UFy5nOD//3+0yp3g7bMMcfZJCo21V6
	+QYlrlRbt0WOayu8pN/tttmiJ7ltsZ6R1RCJ1IJotKNRGrcZZBr/90As
X-Gm-Gg: ASbGncstcXI3ghF8X7G+/wHYUWIZ/ERQAym9MPg7KrrnXyDgNMp0HGG7dnbfrmtduyp
	7M4F0ZfT+wgi93z2I3eWMJcYBvhzkVDBRHl4ecr/cIC+MSSXOqgXNIeiCWktvVbMSckGk57qJCZ
	jECQUo1UEE0gImclUlGLv6PyUueLXaFg8YN+mEooctm22OMSnC1KO++Sr1UzFG/CEXsrQpJpkB+
	4cmsv8eyT47vo4f6zdTNCO5y5h21wfJx3onh/FG3TQppYCQtumZGh5atV8ocuOeUdKUrqVpaq5q
	LGv0YJYjSt7FQC4tZv4tgW5N0sTaNZw4Q3yTxT4X8mqv6l+GzKaXr5rX+t2NG7uDSVN9qJ0HOrr
	WfOwevtlzke2g7QayQ5Rw1d1Yp5q8M2718GBMOnxtRew6GQm9RxVTPKQW6U1kbHMa1uV+h5WU6A
	==
X-Google-Smtp-Source: AGHT+IE1Z/OwXpmIyVxoQR2b0gzAwurG+djLreoBByz8GelvHh6V2irjTLWzn/EqxycJHehXewid+Q==
X-Received: by 2002:a05:6000:220c:b0:3b7:8abc:eba2 with SMTP id ffacd0b85a97d-3b900b4f140mr9419959f8f.20.1754927466454;
        Mon, 11 Aug 2025 08:51:06 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e587e154sm280301455e9.27.2025.08.11.08.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:51:06 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, linux-sunxi@lists.linux.dev,
 Mikhail Kalashnikov <iuncuim@gmail.com>, Yixun Lan <dlan@gentoo.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 2/2] sunxi: a527: radxa/avaota: enable Ethernet
Date: Mon, 11 Aug 2025 17:51:05 +0200
Message-ID: <3294117.5fSG56mABF@jernej-laptop>
In-Reply-To: <20250801002726.8924-3-andre.przywara@arm.com>
References:
 <20250801002726.8924-1-andre.przywara@arm.com>
 <20250801002726.8924-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 1. avgust 2025 ob 02:27:26 Srednjeevropski poletni =C4=8Das je A=
ndre Przywara napisal(a):
> The first of the two Ethernet controllers in the Allwinner A527/T527 is
> compatible to the MAC from the previous SoCs. Consequently the recent DT
> update brought use the MAC node, using the A64 compatible string as the
> fallback, which works out of the box.
>=20
> Enable the sun8i-emac Ethernet driver in the defconfig for the Radxa and
> the Avaota boards, so that kernels and other data can be loaded via
> TFTP. Please note that only one of the Ethernet sockets will work, the
> second MAC is not compatible, and needs a new U-Boot driver. The
> X96QPro+ TV box unfortunately uses only this second EMAC, so Ethernet
> cannot be used there at the moment.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  configs/avaota-a1_defconfig       | 2 ++
>  configs/radxa-cubie-a5e_defconfig | 2 ++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/configs/avaota-a1_defconfig b/configs/avaota-a1_defconfig
> index 55457edd3b3..a4582c00d5b 100644
> --- a/configs/avaota-a1_defconfig
> +++ b/configs/avaota-a1_defconfig
> @@ -22,6 +22,8 @@ CONFIG_SYS_I2C_MVTWSI=3Dy
>  CONFIG_SYS_I2C_SLAVE=3D0x7f
>  CONFIG_SYS_I2C_SPEED=3D400000
>  CONFIG_SUPPORT_EMMC_BOOT=3Dy
> +CONFIG_PHY_REALTEK=3Dy
> +CONFIG_SUN8I_EMAC=3Dy
>  CONFIG_REGULATOR_AXP=3Dy
>  CONFIG_AXP717_POWER=3Dy
>  CONFIG_AXP_I2C_ADDRESS=3D0x35
> diff --git a/configs/radxa-cubie-a5e_defconfig b/configs/radxa-cubie-a5e_=
defconfig
> index 88019acf576..9d204ef5548 100644
> --- a/configs/radxa-cubie-a5e_defconfig
> +++ b/configs/radxa-cubie-a5e_defconfig
> @@ -22,6 +22,8 @@ CONFIG_SYS_I2C_MVTWSI=3Dy
>  CONFIG_SYS_I2C_SLAVE=3D0x7f
>  CONFIG_SYS_I2C_SPEED=3D400000
>  CONFIG_SUPPORT_EMMC_BOOT=3Dy
> +CONFIG_PHY_REALTEK=3Dy
> +CONFIG_SUN8I_EMAC=3Dy
>  CONFIG_REGULATOR_AXP=3Dy
>  CONFIG_AXP717_POWER=3Dy
>  CONFIG_AXP_DCDC2_VOLT=3D920
>=20




