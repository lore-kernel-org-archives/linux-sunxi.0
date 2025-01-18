Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2457346D
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737185122; cv=none; b=h41myEim03TZYg2NIZqUk4gQFbaCwYFIWImoyyvZLaJmLVBEuIHEL5YaVHAd8HyXSNOg98nqd+mG3jrMOjGzcqaL2bRvj/Hx2O0G/CYrQE7His08GBgPrzxLASTxWa9r79wtxDMtruUH7LSR9+/rH+6XmQ8mnB2O6t+YtT7wjJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737185122; c=relaxed/simple;
	bh=Q6NM5SoYKjTNB7MotZdjeLUY0Rg5KV7cRGj7gqNG/rA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qspmt1qkknqd/SNsNPlG0yDU2Sp7/tSyfpNcQc10TGl8EPj6FtYVWtIeNtx4hBtXzYp6mkuLVCcUjFCuTR3EjdARHTm4Cs0gmq8YgMR8+NnQL8WQIV56g3hnY/uL7MZWLaFqKQIQ8hgludznLji/Mqu8Wl3SPdhKzLBc1kf0PSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdtyktoS; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdtyktoS"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaeecbb7309so533204366b.0
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Jan 2025 23:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737185119; x=1737789919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6NM5SoYKjTNB7MotZdjeLUY0Rg5KV7cRGj7gqNG/rA=;
        b=JdtyktoSBDB/YAawmDrxmVlHjaeGQNay9qyZMpIKI33fRRYZsdBtvBRBzKUTTeUWXe
         5wZh72BM2+8SkGKeHTBdzd++QndDpkDwOZYRRSage5HIAXszUFu7pocgKbreps6i+Iqg
         JpJ+TO6SvuNWevxxWXJcIKBeyvWdYTn4XztD6ZEAiY5LPZL0mfTco8MOPqJSD77ejJZY
         XqQIbHBOe29QwJNXOsQ5MbSNquLAvx/aamzsJ6o3NKIcYLXeRDt0ZM3H6O3nAzzDXHSg
         Ywj67hU5OFDWyTC4qQiIX+NU0obLGNkTCt8mcsbN1lAC/O6Ubinzh+NWxnc67N3WAVsg
         mmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737185119; x=1737789919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6NM5SoYKjTNB7MotZdjeLUY0Rg5KV7cRGj7gqNG/rA=;
        b=EcYByI0LRlcI+Diqam7nVujAer3aP1SFB/is7T6FZBAWbcy46oLmDMBLbGXyELCPRM
         +vVJmEohPBNyN0vLczUeRFvvMz8WxrzbXX9VA45ZThT+t4BpKxKiPjtz0NhXCgOjXiUw
         QPDl0u0goBIfKIIZ7Nq5wNYx/Fp5CQpArV9Zv7atu1qbvoOwochkSUiTFEZINaOMtSBk
         aIgG543hvvKlAuFJzaRTfIaJtIEElhMzDlm0MVfe+eoEf3Mxw9W0S+Km0qyEBd6XtmMf
         cbyVUMJtMm7t+fGkgQr6TaABeFIN72mf3B79Z54qb2cVOMp4hORYruGiqG+/LhlxnAKF
         cgIw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ4fbGf1Lodj5rYR+v1jv/uYUDegcGflzAKbt1NkAbM97U0G41Kvz6uHQyJvLSECKDDilGD9Uob5ZFVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwO5dOB6L12mj/d/StVabBv8NywnBprVzCpWbj4zy6JmCpmCcj+
	0ADHJBqYjoRcvQLT81xNa9PyYTdXiVzsDN2oZGQRq3viE7EnuQDw4J9ZTA==
X-Gm-Gg: ASbGncvjuT2y0I85RqvJpSqZICgaNaVOfEnTpsjISR5tMAh8SSGQ3gV6LBzgUkcUQjv
	vTBIfu1oxxxQ2SEmvXIT0GtmWb5fztryJoCuw5/ZjpU8oH53UEPikw/LV3781G0wIMAsUhql123
	6nSyfXfSzrM6V3DpZYVggl/BDjYeZ7O4qsJ+i5X7Z+BR2DnfQbUy+ai3wuQCdPdoLFTPf9gfR6Q
	rDIU8KMtoAidtEf3y7DvkqmkxGy+zANAvDBXd7hUCkHBJHDNXfUPH2R4sTKDvsNFE/LQRzSP1pT
	PWKIFrweO25BbVE=
X-Google-Smtp-Source: AGHT+IGWa/8JOrQHxX/rMghlDOH7g+OOw5DujSYHR6LzG8RJbAwSGcXxZVDvheVQPXHNH493kDeWHg==
X-Received: by 2002:a17:907:3f8f:b0:ab3:3184:6890 with SMTP id a640c23a62f3a-ab38b2eb297mr537331466b.33.1737185118715;
        Fri, 17 Jan 2025 23:25:18 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fc35ffsm287878166b.160.2025.01.17.23.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 23:25:17 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Cody Eksal <masterr3c0rd@epochal.quest>,
 Simon Glass <sjg@chromium.org>, linux-sunxi@lists.linux.dev,
 Parthiban <parthiban@linumiz.com>
Subject:
 Re: [PATCH 5/8] pinctrl: sunxi: add Allwinner A100/A133 pinctrl description
Date: Sat, 18 Jan 2025 08:25:16 +0100
Message-ID: <3329551.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20250117014537.22513-6-andre.przywara@arm.com>
References:
 <20250117014537.22513-1-andre.przywara@arm.com>
 <20250117014537.22513-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 17. januar 2025 ob 02:45:34 Srednjeevropski standardni =C4=8Das =
je Andre Przywara napisal(a):
> The Allwinner A100 SoC has been around for a while, and has now seemingly
> been replaced with its close sibling A133.
>=20
> Add the required mapping between the pinmux group strings and their
> respective mux value, as far as used by U-Boot proper. Linux has some
> basic (clock and pinctrl) support for a while, so we can build on the
> names already used there.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


