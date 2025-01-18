Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAFA26AD9
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 13:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737206265; cv=none; b=RhhDgeORW0dYlYCmUTvhrGc56X2th46UfuyucN/XYUev/b/Lh5r32IrrmOApebQW5fa3x2lmJqQfGIX9/cR8khkl0dkNPqgYo5zZHbd8EO52fiEUoIjaIdSsIPOZ3TA/BxEf/aNi6K72yyu34hyhUYTpIXkCNLi9ETEVA/2H7mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737206265; c=relaxed/simple;
	bh=hiOnSt4CDEnLfEOKd8TSh41PVsAYlATlP6ZPgyV9lH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q3msB8tfvVjiQfNsd9kFlHLsnEbtqFs/Eui2NY1QrYIOZA/4pNRQPKsBeltf6Y2p+F6s6jneOssYaMyVNLGtD7ZcR+BkDpTn/aCwkXSp8DS82Cw7KhzvsNy7cHg/Q70BoSrDzIie6NK9cn1kazMroHW57oGXEXT5K9Z+gBHpauI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfVI4ot4; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfVI4ot4"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso2685643a12.1
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 05:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737206262; x=1737811062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiOnSt4CDEnLfEOKd8TSh41PVsAYlATlP6ZPgyV9lH0=;
        b=SfVI4ot4CsX+VmzFsmif4YU2ZjvLXVDFWISTyVm4NBzALSj0Twsg5urdusvkuZn/5T
         n8/p1i4JC2grQ/191CctdvCrJfgeMCHnNLn4PeCWSWtUE7m5B13aVHFCr2BIOZ2lr2tj
         gTAFsmeoMjzx3pcPAfqq2DSMBnn4Nb1PS+T+PNLIBpeyCIG6pv31nECr7AyuzhwrGI2y
         uZrnBSyAiOwDKTPjP+oHWsuDKJMSsjwCjmDXZIDQEWSf8Z+79TAqdX/fUYda6UjsS8Ka
         jBcoAYdQ4dqqFT7erpQx6AcWDNGzDTkBMwHsrsVRnEK0pd2lw7RMKE5ROoxsk2s513S9
         yY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737206262; x=1737811062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hiOnSt4CDEnLfEOKd8TSh41PVsAYlATlP6ZPgyV9lH0=;
        b=MKj2weZ5UxZpDvbdxiNE7znBKuSrm3eueilm5JgnkCQgA2VnWtGSHN1C71VXsjLHUi
         jJIwtA1Qgsf/BTzYGQcKU7Vj0lZPBfOxgtixp9E463S6F2+HuJFJb26y5MA3LpFgyiRM
         mcIPc8HqmUk6K3xIPORbYmv02rsf/QVFma9mak1g3ZXX2DliJngHui+5/adklLV4kdcr
         9AmMpKyZ3AN4hqAwZWPHElDYJK/IQxl4DWGcIbtGDeTvlrxWIJ/lBRauSGkEXhykJoKg
         PP2BotI8vdrIutkMcONRjZy+THEkDoZ0V+TLv38M5jYQfQcYb74VEmYkYNMA6bdJYrhV
         AY6A==
X-Forwarded-Encrypted: i=1; AJvYcCUIOQRri17YyC9B+JudTTo4Qo8xehGkvYQ99pJY1AikLjXd/NgNM0dZoEXDbv3V/vUW6E5smCtRjozH0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTZn05NWtEMY8oj5hsUzE24R1DmJLON2f6HgTm6zBOaehKjEpA
	/8jRR2UzDnvqLamgEd+uaEmYARZywPYYZdDvnvuk4sRQyA7OZ/rb
X-Gm-Gg: ASbGnctskRpIWR2b67qBf2TQvDvoeQlyVGzYQRSXqTfJwlustXhqaotNYl1DjHA45qM
	6GPO1ZwWIl9hHGKtlIr+7oslbroohyYTgijPs5lbHoyJ5KDahMvYKoSxUeeH6x+2vJkU87J8xjm
	74nDSqYu1rZCCTE/VurAfG26/IoIY6M4J/WOidtaEWgBqjKF0WQDiIQkSxV9gbO38nSjdIVeEcR
	KSH+2X7J8AaLG5huc2tAh3KS6J5C+1pmKLLWJ+aWh7WeochQV0HqescVfuPg/QaY3Ot8jMTWd6a
	foYKeTPzJ51qpw5B94lUFefGeA==
X-Google-Smtp-Source: AGHT+IFFti1/tZj8e1vP90qTGFiWr/GV7Ik5rVsNImRR/WGzUU5tZlbjRu4Ye6eJGZXqi2al2PUGGg==
X-Received: by 2002:a05:6402:27c9:b0:5d9:3118:d0b8 with SMTP id 4fb4d7f45d1cf-5db7dc6b573mr5022930a12.8.1737206261687;
        Sat, 18 Jan 2025 05:17:41 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73683d28sm3167269a12.40.2025.01.18.05.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 05:17:41 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 06/14] dt-bindings: irq: sun7i-nmi: document the Allwinner A523
 NMI controller
Date: Sat, 18 Jan 2025 14:17:39 +0100
Message-ID: <2763297.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20241111013033.22793-7-andre.przywara@arm.com>
References:
 <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-7-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 11. november 2024 ob 02:30:25 Srednjeevropski standardni =
=C4=8Das je Andre Przywara napisal(a):
> The Allwinner A523 SoC contains an NMI controller compatible to one used
> in the recent Allwinner SoCs.
>=20
> Add the A523 specific name to the list of allowed compatible strings.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



