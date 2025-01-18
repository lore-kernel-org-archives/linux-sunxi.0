Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89AA189915
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 10:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737195764; cv=none; b=Du/EnwUF1ltclmQWcN6gZ6pCunFV8MF/KE9vMX1/OJTeIyhwzEv84DcqnJLsBuwubA4IWtDp7GsnxFWaF5pf0R3cRpXP3bTAOH176n2NYNPWT38tCCOjoCa/5oz+xcoyr9ye2/k+KMuBzNCLl7spI0plUJV/O3uq9Ngyz1Gf9bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737195764; c=relaxed/simple;
	bh=4zIPKEsQijcqzQ3nA6LVlbYADaGYU4wuwM3qNa4iVOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=clDtZaq65Z3tfT+QM3bOAxnBkqQnIiszP2WMH3h/07qNFDpL78fsh59HP4iLUkBLArASgdz9AJ5q1fSqJN8hIoRbXeUb318NZOcm4WTMCgVWfnNA4euiyclCa6Q7vPqDT7CFM+9KJkkCPF1T6HbQxKpPXnfIRn4FBw/6HRsN0IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9DDdxor; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9DDdxor"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab2aea81cd8so498390566b.2
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 02:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737195761; x=1737800561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC562IGNdsBslKvrHku3T+cv3/NWv0Sm/Mud6kF3qcU=;
        b=I9DDdxornE0EcUO6z7E/0MyWyV3tFuhetWFBbIDAVEg5WHjyezxaIMvFr8WIZtpMqQ
         3K1mCzPg/3+LRGiR3iJm+wV4RKZGiWCo++M6A2yQy+6954PTofQjC//u/42vQy64T9zW
         jPePkdsgEs71IUGhMGTa6oP5nLq/+eZ0fLU8gWprlFHF/lSgVREsAXkYgo1XJAt0uwiV
         j9nFbBwi4q9Mea8MRozSmVu0aGZ3s3+EAsFpaS7JguFavZQZBuZe37xjhgvVlGP1Z+ll
         M5iFMWgiJxKSELNovg6nGvyfgWVhHptrRnqiRWDCzF8deEBEc+QuaA5EVYKWyDSDe2uM
         dp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737195761; x=1737800561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eC562IGNdsBslKvrHku3T+cv3/NWv0Sm/Mud6kF3qcU=;
        b=VXb5/y3TbczEk+2pEz2whwjrx5NMnEj2eP1ak6dz6rBCl9wUhcEEpsld8GtcXALyF+
         DpVQ40ZTir4VvVGJCQJnOOHQKFhu6oGzNj7Km0nH6BfSDTjs+etfyk2DURiwkPq0A/Ay
         KpAVl/Qi80BjuNIrdAcNn5gtFGQfom5MXFGtZU/0PqNd/LIx9wV79lC1dRheYwAF9L50
         oepbt17uainUVcxkZsOpBRinU/qrCu53qqw0ngwCrTqKLWdIEePllueFSlKreukHuE2X
         7b2+ql75Pl4lQGZVHncMBHyw2tLfBtJwUBK7nloxiJvsflypIqsEbaMt5lv9rL2wP4tq
         bTIw==
X-Forwarded-Encrypted: i=1; AJvYcCVTgR1bQz3LKie04Ds3sYy2aCCTNp0kLh0Yu7UVCXXhJRgr7f/5mSlz3eU6Zy12gSCdE9IDYFQBnBmsvg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzwaa5sjsFIQUlapEVXZn4cevhE9AJMuPBcINzuAVX0LgEOwr6t
	gRwJx3woTw0B+Vk2MiD/KH3ArZCK6CtGk2OYmqYzATSUuq1hu9M6
X-Gm-Gg: ASbGncs+/pK/Ay0CdIPAyG+BpHjunqeDPTiRL96JYqQrXY+MrG9EOPxI72ldNnF4kga
	5cfJejT/IPjBvQByuRK+8cnfceCdmkAVfs59xZf5HUxHy6VIMbpSIO7otzI1Gy12R9oVj7qR1xb
	bdZ6clifI14dkMj6ulg/gu/ka1c9cza+GhgVDhVAVhyZ1MWw07qlHCc1JbvyHg14bsQXwkN4+v2
	yJwEPCggN9aWWHLhl1RQshbi3rdc/FdrzkkgGYBAZTJEi68oNHylt8FNone2Cx7iiIFLyad2UAC
	VjYvhHskn8qz65w=
X-Google-Smtp-Source: AGHT+IE+y1gp+riQD30Inb1lrysJjHeJCu6/sl+o+LPW+5g5AYkhktPoEz8aolwvSzUCLAkf/TSzCQ==
X-Received: by 2002:a17:907:d87:b0:aa5:b1b9:5d6a with SMTP id a640c23a62f3a-ab38b3d6d1cmr587932766b.54.1737195760645;
        Sat, 18 Jan 2025 02:22:40 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f86206sm311092166b.134.2025.01.18.02.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 02:22:40 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 "open list:IRQCHIP DRIVERS" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 Philippe Simons <simons.philippe@gmail.com>
Cc: Philippe Simons <simons.philippe@gmail.com>
Subject: Re: [PATCH v2] irqchip/sunxi-nmi: add missing flag
Date: Sat, 18 Jan 2025 11:22:39 +0100
Message-ID: <2220251.Icojqenx9y@jernej-laptop>
In-Reply-To: <20250112123402.388520-1-simons.philippe@gmail.com>
References: <20250112123402.388520-1-simons.philippe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 12. januar 2025 ob 13:34:02 Srednjeevropski standardni =C4=8Da=
s je Philippe Simons napisal(a):
> Some boards with Allwinner SoCs connect the PMIC's IRQ pin to the SoC's
> NMI pin instead of a normal GPIO. Since the power key is connected
> to the PMIC, and people expect to wake up a suspended system via
> this key, the NMI IRQ controller must stay alive when the
> system goes into suspend.
>=20
> Add the flag to prevent the sunxi NMI controller from going to sleep,
> so that the power key can wake up those systems.
>=20
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> ---

Please provide changelog here.

>  drivers/irqchip/irq-sunxi-nmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-=
nmi.c
> index bb92fd85e..8dda0a85e 100644
> --- a/drivers/irqchip/irq-sunxi-nmi.c
> +++ b/drivers/irqchip/irq-sunxi-nmi.c
> @@ -186,7 +186,9 @@ static int __init sunxi_sc_nmi_irq_init(struct device=
_node *node,
>  	gc->chip_types[0].chip.irq_unmask	=3D irq_gc_mask_set_bit;
>  	gc->chip_types[0].chip.irq_eoi		=3D irq_gc_ack_set_bit;
>  	gc->chip_types[0].chip.irq_set_type	=3D sunxi_sc_nmi_set_type;
> -	gc->chip_types[0].chip.flags		=3D IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF=
_HANDLED;
> +	gc->chip_types[0].chip.flags		=3D IRQCHIP_EOI_THREADED |
> +											IRQCHIP_EOI_IF_HANDLED |
> +											IRQCHIP_SKIP_SET_WAKE;

Alignment seems off. With that fixed:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com

Best regards,
Jernej

>  	gc->chip_types[0].regs.ack		=3D reg_offs->pend;
>  	gc->chip_types[0].regs.mask		=3D reg_offs->enable;
>  	gc->chip_types[0].regs.type		=3D reg_offs->ctrl;
>=20




