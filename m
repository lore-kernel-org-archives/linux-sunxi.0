Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469B510A1E
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Sep 2025 06:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757831201; cv=none; b=eOBfJM8BSJJXS9mO8UXEXSlKXI7UIUI9kMySpJkcvvsl7uHaCfhNvhaTrYKRxMbhsAp6LOFw0ka4qak7AIBAZO+0XPrCvlHA+nXb2cAibfVqFfmNMVAdEAIW61z0EaYzJTkeWRzTdAET7mBNYQZIP4nUob6ohy84axSLigP1VJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757831201; c=relaxed/simple;
	bh=YpuAcY5BhVGhX+vCzPkKqiO0eWSE/MtMicMqARPCFKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=py/+oz7TGDeg3PFaxTzCbwjjc1HPyC55FRhLWbvv3kfx4rGTJ5TDsZGIZLZ9mjDx/7VtPjJhSp5LQHO/jNxeUczKAgmAgbx2/lbBRp5CGMnJbMkj59vKiggawSCHkbZZ3B8hanUU02N68qVOO5JcXq72MJXomXnswq1XE+Tb0JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXsOHiUf; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXsOHiUf"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b07dac96d1eso220344066b.1
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 23:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757831198; x=1758435998; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpuAcY5BhVGhX+vCzPkKqiO0eWSE/MtMicMqARPCFKg=;
        b=KXsOHiUfv0GUUl+iGd5igUMqD1Mo/2gegKJWovvEi9suPQ/ik34ia/8SOgW+BCmxYR
         leSECjZd4NSLSdg7YtiT9cTf8WSijFqlNLENrADtWIimgOIeg/89XfkvXdRLP8K0jj4s
         ayfGc7CNJ3XOpFegSzUYBb5wbE0SXfTEy8vyeVpy9SocpMmU1KQvi7Tu71bCrEXljknl
         bVX+xBf5nEQdCTF4iRw3e8X+OLZCiWXfKOtWuwoj8XOYKBe71oC62M8obm4CaEdZT6YB
         3q8oXbLLXVmZg3lEm3ef1bYbLhQPmEEGht+PSkk09h0pvYQuvqvT2t+wvPtxdarDpH9L
         K2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757831198; x=1758435998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpuAcY5BhVGhX+vCzPkKqiO0eWSE/MtMicMqARPCFKg=;
        b=HqajRFvMnCrZHXvIklmtuJtp6e9rV1X7ZwMJKiqEQXzU34ArMyd9GgrMUqoOzD4LoY
         oTgtApoNwh/vRkurxgAMnkpZ69ICIAuCHtA/lmQ72JguhRFL8W2/WXs4KCxeOiqXwhsO
         vycBIB/Py4J9DMtvH+JYWWx8dGj2pWaMn8Lwnz0jMDitscJIse0Xzmtpd8sDh/Rl0oZC
         1VugDUNws/v/lMuSf1Wsi9NDLn6+uHfe4z6O0LeRza6T6YvXCyBSHFsqGfdoARn3yYeD
         YstJFaRwcjxs9MWrjQNQP1BL6gx9DtXlPB6uAGvSt8LPrZKHgQ6gCIicyRpx82xFJBAw
         l1Jg==
X-Gm-Message-State: AOJu0Yz97PMH4OjbbXe4elJCaTZrxnR4sRLmUNzd3NXaFi5zxnbLhWmu
	sfUDJsPdAYJJ80duwW9UmBt5KZHDfGQfDHbl228PNrjqbb7kYpia/DC1XjG1jQ==
X-Gm-Gg: ASbGncvgGZpPl8gcMdbgVt1JBU1B6j8SKBjjuWY1MJTxP8FANqJAenw5QRqFtI8eTge
	JYATFTnL6uyLn6g8xXGq1LLaeKjVqDFdp2ZrIl7YBBk3mW95xESUnhw2CHOg1/23YMTI1rSSpcg
	n9L/W2ziRcODwaJbWEPZCicIccRF/NOvfw4+xghXW/1T3mc5NkZ/WPPGECOPH6R0QQ68h4441EH
	eiI7uZ/AC1L3odV7EGIiqr8Cu5C8Km3hw4hotBPN45lAnxV3rh6CGWNRGeFjo0sY529ggEIjDsC
	qdGRFgvGp+jZpisXVqqxF2D8nfnzNsmPsnl4zzDpqk6gqSne+Ngljd6bcUinfY2pUKZefBSQUjw
	hbTs6aCiBaVWdS6OcI1MaAbN71W+FzsggIG9Y+yFK6WcQjAYTgM5/s4o=
X-Google-Smtp-Source: AGHT+IFgeECwBC/iiy6U4djD4RbKGuu6VUzMWKgjTe6SxUwypL1QszvVkCmMnx5qTasPZMrBF3ONRQ==
X-Received: by 2002:a17:907:7f94:b0:ae1:a69c:ea76 with SMTP id a640c23a62f3a-b07a68b646amr1170055866b.23.1757831198374;
        Sat, 13 Sep 2025 23:26:38 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da427sm699505566b.7.2025.09.13.23.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 23:26:37 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] arm64: dts: allwinner: sun55i: Complete AXP717A sub-functions
Date: Sun, 14 Sep 2025 08:26:36 +0200
Message-ID: <2235173.irdbgypaU6@jernej-laptop>
In-Reply-To: <20250913173511.4064176-1-wens@kernel.org>
References: <20250913173511.4064176-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 13. september 2025 ob 19:35:11 Srednjeevropski poletni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> When the AXP717A PMIC is missing nodes for the sub-functions, the kernel
> complains about not found nodes.
>=20
> Add all the remaining nodes corresponding to the defined functions for
> the dev boards, which have publicly available schematics to base this
> change on. The battery charger on all of them are disabled. Also add
> an "iio-hwmon" node to express some of the ADC channels as hwmon
> sensors.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


