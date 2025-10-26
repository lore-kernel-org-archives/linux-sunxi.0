Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E73288D6
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Oct 2025 06:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761458768; cv=none; b=XjSI9Gfk6qYhIoFw2vI1FV95YuSEnrEVY1sA0TFoLiBIiCXWqaUClOMNcqJVdFSEQvvY1nJGLbnudd8dJLdhDUVIYSUIJfxeyKpnyX/pJWreyeu0ex38r6VNYYy/iQT9oUud1B99iE+2fBvkdKj6FkKl44dkjI8Xb/4jfFkRlqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761458768; c=relaxed/simple;
	bh=EjHxDnFq6hWj06vQPtexXZ2zxvyOAy7rfygMeOh2J9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QxhjEzbWrcnO27KikVQ/jBSRJ5ok8NUg9ceVuCYFKK33no/ESErOCC6gwYARihIYA5P8Lw3+JqJIK51aeGJs0jLyrqBQCWFpdG7svBCq4VIyUnjSrPbY/dL98n1tC1WIiGVnWugz7upm0Y+N5oeu09dgFkNEU42LvudaRfEHIAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laP7c+Yy; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laP7c+Yy"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so795171566b.3
        for <linux-sunxi@lists.linux.dev>; Sat, 25 Oct 2025 23:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761458765; x=1762063565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjHxDnFq6hWj06vQPtexXZ2zxvyOAy7rfygMeOh2J9Y=;
        b=laP7c+Yyo9ozS2UDJPoyYC751CHGZDLx7HzuVdEurtMZo6KZNvB0505WTIYp0PfO6B
         oRm+gHBpX5EwsG8LPtNa1Knlx4apbAW4us8vsMmio6X9zn+bUbsjlTyUVibmZDTXMATv
         dmhpoVGgq34y5N8Yvqz2SFZ1qEcf0CIgJiDy4ZYKIpjfZxjB9P5aDnfh22Rg7zrNZMqL
         f1WRc70d/4i9fw9AgAuNBcXJyuaq4deIDp9DFDDRMwQu2mjRIT0FY9eyvh66jQdPOQPS
         uZsyAKoAocrhPC0y+mOjadz3faGDkhfuHAPweZ4byOH2VFtTf2zgkKLVOKJYrPdSII0G
         s3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761458765; x=1762063565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EjHxDnFq6hWj06vQPtexXZ2zxvyOAy7rfygMeOh2J9Y=;
        b=oq+739kBGopNVfXwMkfMTpY8Mrh1tVF+mX7ueR/RV8jS5m1iKOcxoXD9I6US8j+FWJ
         7c2HbHJrSuk4IreP/vBUei33Vui+TNwVFSP11D2wOkfrWnymkdmQJ5dp1ogtxowZGF19
         IuJLj0hQEhhzbKcPHGgnYdOED1FKxhq4I2McQRBsuRNXBzpjk4DS4jXaIVz/aWPgDkWE
         fpQfFdTFFr8Qk5F3oVdHilW1IgerZsnOmNqRGqsS5iBkAi1PLo266svviKIrsN9awdQg
         3vGEUrjv5FkX0k3JF5pErSaLUSfNMahbcTdF0lsZNoJK9XfKgoqSErz9yB43NuBVt2kH
         rPjQ==
X-Gm-Message-State: AOJu0Yyg8zEA0JIg3xLPNvneYj3arjZmKcj478MQ+7Uycy/134DH6wl7
	VjY31PF4kubZ+eLaknFw9Q2Gdx+u+sO9fzkmsIs+rZdAAKXdVb2BJG56
X-Gm-Gg: ASbGnctfLZOr1ynGZy7zabYPrAPILbiou9E5G2W3MFxgILgyWsMmOB5k+luNk1gMLWX
	g2ccHjmPZeimcfbCkH5oJ8SNBBQyHzOuDlJfIpkdf2w3HTJ9RpxeTaGLH00/O2650eJ2mhlzFcb
	BDDDZXHkbsYw2j5OVsPsnwDN8Zh55hHGG/o3kju3TG3VX/t8JAnffBKu4sIEOX7QjIElx8H8i0F
	rpxv43I98le3d2hhZhYVgp8uT8DzOdl09BBpI7DHI4T35MiOqCOqgN8IIPuM3h6OCfx87zKlpPK
	fhR6XE6t8i8cYYzN8k9jTEZVUGI/cly3AKR0ojBide902aDQskRz4Wpjh4PsUxPv71m53NKQ7RY
	XDI2v6TfYcb9BK8q7uzUMnZOrsKvjtm7fkE8ltZcVZQu3IDpqDmotFhew0pnF+aR3LQKEPIBIJr
	4tHs/X7e9eci6vENScsmqm4ht4Z68gRSlb
X-Google-Smtp-Source: AGHT+IEahd1gKXwaxuSI6Ez7+8D1h3ePdjJtLLs2kMEhingxxl9Gc2tP5pgtxBmeiAugD3qcnIjxgg==
X-Received: by 2002:a17:907:c11:b0:b32:8943:7884 with SMTP id a640c23a62f3a-b647500ee9amr3536092666b.45.1761458764756;
        Sat, 25 Oct 2025 23:06:04 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6c13fsm3233783a12.7.2025.10.25.23.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 23:06:04 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH 2/4] sunxi: switch Allwinner A80 boards to OF_UPSTREAM
Date: Sun, 26 Oct 2025 07:06:03 +0100
Message-ID: <6203838.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20251026012357.16773-3-andre.przywara@arm.com>
References:
 <20251026012357.16773-1-andre.przywara@arm.com>
 <20251026012357.16773-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 26. oktober 2025 ob 02:23:54 Srednjeevropski standardni =C4=8D=
as je Andre Przywara napisal(a):
> In contrast to some other Allwinner SoCs, there is no difference between
> the DTs for the Allwinner A80 SoCs (sun9i) between the U-Boot and the
> Linux kernel repository.
>=20
> Remove the old copies of the A80 related .dts and .dtsi files, and switch
> most of sun9i boards over to use OF_UPSTREAM.
>=20
> There is the Sunchip CX-A99 (family of) board(s) for which we don't have
> a DT in the kernel tree. Keep the .dts file in the legacy U-Boot DT
> directory, and let the board's defconfig opt out of OF_UPSTREAM.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Same comment as previous patch.

I'm not sure keeping Sunchip CX-A99 makes much sense. This means that
there were never enough interest in it to at least upstream DT file to
Linux.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


