Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA8A39FD9
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 07:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737184954; cv=none; b=bdHJ5KK+zfOtP98w72cze29pQpBzSKDq3StBCrc/YNrCjrmj+xeYEpNiDm9URrJFgspxDB4CmGtXP4YgXclwX8q6p2RQvYpdSFlaIxtYRJk2orjosOAyAy71YoY6yZ48j7ar1sJus+hvm3RacAbsLGFAzyueVQAlRGPV6ygA60k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737184954; c=relaxed/simple;
	bh=ftf3AKI1gOXSjPDP4MhsGdFYttf1FlnZv/ywvWS62ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DRQvAHE+fxOFHEusX58P/gtcjN7bXMDXv/A6Jx7dUgvWrGckJ+BfPWGWpmlv6ZvNgXYyei7KQ3m5oG1fTCcxo/vBszP8TV+rPoP0rBUo9A9l4K1T22C05+ihZr7lxAS7+oIGOCjvB2W+sTimtX9USoe6DlxENv528Bh3WXe0pKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAg7gThp; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAg7gThp"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso526715966b.2
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Jan 2025 23:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737184951; x=1737789751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftf3AKI1gOXSjPDP4MhsGdFYttf1FlnZv/ywvWS62ZM=;
        b=ZAg7gThpHzR9Dc/BXmGMiEEnn/XIIpcw5HCv6I0hNH+odCMNf1fo81enYxrH7l39Jf
         ctweI2uoBDwy1C7Z4jUZxiSrX8rHRLEBuLoS2Ig+MOWC40Lua55l6FZa7FtBDXdlS/eh
         DrRWF7qjDIzvAP1Ec/ilLJbfCZMojCKBLUTA6zon4sq5x/DIAs1kQjs6YpZfakof6mK1
         v6q6rGjAf+W3J9N2T5R86b9XFujjwplZFeGoPoHfpqgpQnf92mvZuD/wogVOScTjR4ok
         T+dHGbsEUepiVbIbo3y/j/Dl/1cK2FMHQb8E+Cf+oSwLjgORN/C1tz62coa/K1wgeMYN
         tG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737184951; x=1737789751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftf3AKI1gOXSjPDP4MhsGdFYttf1FlnZv/ywvWS62ZM=;
        b=icZuo/g7qqN87s3G9s4uLyd+XjyQjc38zyRtQ/RxM84JZhrqp54i9mnkZymMNGgPSi
         O2xKcji9WW2mCtAvqaYLsjiX5hhUf0OWBTEKgKcFdwU5/JD5CPRdfiYmMJ/iquyFxGD4
         Gcnr8txGWXe68oilUKeCEEf8OZaDJXG6APBvBCFC2qp+KapmR5p7Fcx+837tgRA7LfWX
         NTCbxmAz4Uu7xTsCpjZkYXa82p+E6m/mScwsqVJTeiu6YvYaTstNIzQFQ0lR61z3Ln81
         un8BRBO7NOY2unvXXLjPcsVIiV5GBlD/b8++JJrfVoYxj8M7bkUc+GM794/d8p+WfiY5
         MdOw==
X-Forwarded-Encrypted: i=1; AJvYcCWjXnUlb5kjNUE+JHeP4YbRHoj9YwbADJ4nqJ3L2fKLIGl/lRsWfPFHUrGzSbsYqco9KkWZcJAuSGygYw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx59+29wLoKz+cRwoHcJCj+FcplaQLS5Tceg85cYhgZOn1Cdpf8
	QX9gmnmFwznBhpXXwNpqpJtCPEei89rxNeQB2XxT4Xh/sMPkuE95
X-Gm-Gg: ASbGncsPvc0ML0fFhPDWkV5pOkT3Orx5Vgml6L3QfJfVcCCXnSlCJCxvbEgIK76w3Td
	THQfJang79JfCdWhll9KQ/6lcxdA9+RqA9K5EYOghrZF0wDxKpd++AEh1LOiHpEQiDDXMqteVAj
	pQ0F9VnchX0lc1pVFXkpRinExtZfSOk3yI4mBq0sA5iEpcHga+KWG7gekioE5TGisVTijKLzOqZ
	Ee2cmrzXd6vFaPiclNKX41k3oGtfih3D3JTIe/cpDy69qMDNpabIS54e6uP6A1GbsdRnqEYHoUi
	6dNwyv1cgQBI3CmLxnnH6jTE4Q==
X-Google-Smtp-Source: AGHT+IFztTGE5C4Momd3DiF/L3uaQXeq1f9jrSr3F3OTeRqTGvNNBN6uR1LyKIKGaqQcxDW0YsywzA==
X-Received: by 2002:a17:907:7296:b0:aab:75f1:e51a with SMTP id a640c23a62f3a-ab38b44e04emr557490266b.38.1737184950724;
        Fri, 17 Jan 2025 23:22:30 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd5e2sm293583466b.170.2025.01.17.23.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 23:22:29 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Cody Eksal <masterr3c0rd@epochal.quest>,
 Simon Glass <sjg@chromium.org>, linux-sunxi@lists.linux.dev,
 Parthiban <parthiban@linumiz.com>
Subject:
 Re: [PATCH 3/8] sunxi: H616: DRAM: rename Kconfig parameters to be more
 generic
Date: Sat, 18 Jan 2025 08:22:28 +0100
Message-ID: <1908509.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20250117014537.22513-4-andre.przywara@arm.com>
References:
 <20250117014537.22513-1-andre.przywara@arm.com>
 <20250117014537.22513-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 17. januar 2025 ob 02:45:32 Srednjeevropski standardni =C4=8Das =
je Andre Przywara napisal(a):
> The H616 DRAM controller requires some board specific parameters, which
> we declare in Kconfig, let each board specify in their defconfig, and
> then use in the DRAM init code.
>=20
> Other DRAM controllers now require a very similar, if not identical
> parameter set, with so far the same parameter names used.
>=20
> To help keep the Kconfig file at bay, rename the existing parameter
> names to drop the H616_ part in there, to make them more naturally
> reusable for other SoCs.
>=20
> No functional change, just a rename.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

That's very welcome change.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


