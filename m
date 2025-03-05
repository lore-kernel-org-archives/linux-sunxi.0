Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D411DD9AC
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Mar 2025 18:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741200633; cv=none; b=YGA6lk92YUjCXxiUVIurBbJ8tNcl0wsU3YV76Fio4iB1FOXzrxdvr//zcXy4R602YWANS+l2FZT48efs2nG7STLzosnLA5AcN2Nw22KAS8h3CIgYj+lfeNmwZ/2acitKScL9soMEkgkaX3XzJBufKgbjQgCCdv8Os/qzCtqLoSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741200633; c=relaxed/simple;
	bh=gQTj8Q5JHzsGXzIfa7+8g2ZZ2VR4JimKv96wf/5CAZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ggyIFOCkl0oQ6vIcBK6BDkq9wZdQ3urP6oSbNceLrADBC0g4yZKHLO5f+mYlw17V8Ah05LB00M1d75Vp0rEQlqH2VcYGfH7rte0/ggfTnTFvKxDCOfKJV89dGrUpqLT4+v0IsQiujlRBAFST2MDQFo8ne6HlsuJgjjIH/XyIau4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZV7xzr2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZV7xzr2"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43995b907cfso46648545e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Mar 2025 10:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741200630; x=1741805430; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5H2Dkfo/vt5zHKiZMetuzkN/iESwQof/o51gqGwt4o=;
        b=CZV7xzr2yOitSxi5Sy+l6IJyqmzCHOczV7GbuwZdRtPx0cM/iO3qXJiRBvlcZR2DqX
         mhgkuE5rqTryO0Nc3X8HxSPJxb6iI1NVWPV239r2kWA8SjZKuDOGP/JGun1nxyi/2PCX
         vUK4YhMEY4ZAXGiBCyfWR2R4IPRzb8JSS391CXVEeS2BEaMvYAFWn083ydxuZtwruHHi
         NSHndNHKn+czshF2S/x4MnEkJtbTynGDgEI5YNq+J6t9qTTcr2SkpCjpgNC4BxDS1gA7
         YQr+BTZ3DupayduyoYV4oJX26oaGCkGZZ4G8HooHiH2VshTx8ObJjKWn03g8GVJTDNG2
         fZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741200630; x=1741805430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5H2Dkfo/vt5zHKiZMetuzkN/iESwQof/o51gqGwt4o=;
        b=PgGrj4e0Xok5mXhkIlJKZob9MVwF+oGXQBxZiecMPnbiWB29+KnpungAWRzH/g4KF+
         pl+VJb9nUzXErvDJj/jPriHUSZc+MdbMgo5h38glIWG0RZ21Qe95KKepCWv7YAVIe2ct
         8oh/h1bBUbzBnMjahOc8aspSyYmjSMri2znqSF+WEslRkJny/uvO+Jaj8dOmdmV4Yr04
         ibuA8G2P9t7ZJwquY2ff2a8ToeAPQmxrOAriM17Ktp7BjVSrQmvqpulbgqAGtZzBKHzl
         0Kq7So0lr+9KL1QnmvCjFt5sn++k1TZXRLGQth2lMmRPhm9CJWKSG7AH8yrVCN6vuES8
         Z81A==
X-Forwarded-Encrypted: i=1; AJvYcCX5/TfB/KoS+k0l4V0I6U63MVd6R8lBdpPkx4TcIXgqtUkYsyo2f+jPs9oKppRS4rZfbCkpyPOKC+43Sg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw2TsojUNZLOyvkz8FMbygehetZghNLth6QdDcrjrJifvA4l3O
	1kJ4J2k0q2i2SmN9yOf/lyqF0EG4nE0ofxbzgWwFJD6Oz6DGYHLN
X-Gm-Gg: ASbGncuyggxesZEbAIAyw1tYPGrel8K+nnPs/jw3uQJCWmslHx645RLgEB+4KM6wWHr
	MaEbCrOz6+RNDecA8RXwYS3WwCCFXLOQ09ADxI8YXoQN9B/6xgW8LuCe6sB81UhW5kMrBPlnbmA
	WkG2r7t9PUnXxTAmbs58x9cAZI44d527TQ3QWyq/E/crTBLtBBgjU9dKKHLu6m0DkYb7OhJzwnk
	jHPEbnH3ldftWlcl6VWionSQ/+q0ABJ5hMkxg3XLp1Bh2nOcjkeGowE3Lr8S2IGGiEAYU/9SuTH
	g8R4tR8aKyIoV614yDpaXBg2/Ruffv/zLC/JCR3PAMNp8np1NcKeSOATJ3IQ26cWupSd14yQ2gQ
	fZx69/tCdJUETvBhF24aW
X-Google-Smtp-Source: AGHT+IHnaRGavcvn0zG6fKQ1AhWlIi2RHdXvleFHrMhG9CHQJjG0/o2DM0tO1YMGeqqMtj5xnwthcA==
X-Received: by 2002:a05:600c:458a:b0:439:99d1:d4a4 with SMTP id 5b1f17b1804b1-43bd29c3ecdmr34059305e9.18.1741200629617;
        Wed, 05 Mar 2025 10:50:29 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd6530f26sm20378815e9.4.2025.03.05.10.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:50:29 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 12/15] arm64: dts: allwinner: a523: add X96Q-Pro+ support
Date: Wed, 05 Mar 2025 19:50:28 +0100
Message-ID: <3805591.MHq7AAxBmi@jernej-laptop>
In-Reply-To: <20250304222309.29385-13-andre.przywara@arm.com>
References:
 <20250304222309.29385-1-andre.przywara@arm.com>
 <20250304222309.29385-13-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 4. marec 2025 ob 23:23:06 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> The X96QPro+ is a TV box using the Allwinner H728 SoC. That SoC seems to
> be a package variant of the A523 family, at least it uses the same SoC
> ID and is compatible as far as we can assess.
>=20
> It comes with the following specs:
>   - Allwinner H728 SoC: 8 Arm Cortex-A55 cores, Mali-G57 MC1 GPU
>   - 2 or 4GiB DDR3L DRAM
>   - 32, 64, or 128 GiB eMMC flash
>   - AXP717 + AXP323 PMICs
>   - Gigabit Ethernet (using MAXIO PHY)
>   - HDMI port
>   - 2 * USB 2.0 ports
>   - 1 * USB 3.0 port
>   - microSD card slot
>   - TOSLINK digital audio output
>   - 3.5mm A/V port
>   - infrared sensor
>   - 7-segment display
>   - 5V barrel plug power supply
>   - power button
>=20
> The PCB provides holes for soldering a UART header or cable, this is
> connected to the debug UART0. There is another set of UART pins
> available. The board also features a FEL button (accessible through the
> 3.5mm socket) and a reset button (only accessible when case is open).
>=20
> This .dts just describes the basic peripherals as far as we support them
> at the moment. The PMIC rail assignments are reverse engineered as far
> as possible, by dumping them from a running Android system, and correlati=
ng
> them to other boards using the same SoC.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


