Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8EF3161B3
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 17:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761587925; cv=none; b=MHOqiu3RnI7eep7NQsG2jO/H9fingb4ImhmVxjRKSAGE9/juj0q61mmTTdkBzNCV/xcT/S1ak37RLLGK4hy5gHy2P13odar2itz+XWHX73Ah0FtBXZje/M+AyRpxbG2c4g0OrjTXGyIOhYf2OSV46HUx1tPRQZK7uA5cm+E32CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761587925; c=relaxed/simple;
	bh=lrLZa5alrgHzC1J99K289oAUToN5br+ZIZn9l5DB14I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pfu2FBiDWC6fLCdstQyy+uhGUDCBkltTR0F5NIxuLswxRD//iml21ErIDIVVKcyUiTTj6UsqUfFmmMurSqL5P3Pgpilsfcv1gXSPu2puFUmSwSaIL4iiHUUcssjgzCXhj8DFwk9o2n22+Jt2ZORGlMbKJ68oldRrDTzOafMvxd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGZlcF+V; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGZlcF+V"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso2879337f8f.3
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 10:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761587923; x=1762192723; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrLZa5alrgHzC1J99K289oAUToN5br+ZIZn9l5DB14I=;
        b=OGZlcF+VcdYedkUdw1WwLuR39EeQIEXLDcJwlxChxWmyBaUmkiTOx9RC7+18Lzs3zl
         p1Xqki+dDO7jMhu6rm7uHQUQLPgHkNla8Ext2tMxjkzZzUfOfl7jLIVwY1lCp1GoY6XK
         HAAHkxYXNX8w1d7Pjs3UAAXHoQ2LI8GXEFcNHcZETwfhxvaDap0h3/fU0rAQ7gHss5Ge
         4cl5DWy/uI4j/usTDH2K2vrDfJaqD2D1SOe4QyLF4l96Rp5ALEyQe7sDgddSXzdWH6d3
         uK2J+xQGhsfNVL8p+hzjQod5h+2NLIgGq9lmr7Q+Ph7ExOHBHDHg+zVfuij5w6uOAme8
         2HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761587923; x=1762192723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrLZa5alrgHzC1J99K289oAUToN5br+ZIZn9l5DB14I=;
        b=Zm+lonuncEkR38Lnyc85krPIhr6Fur0DxUfENziZqQPFthkHwtScp9EADYtx0Bb8Xg
         TCULoq7r+UxSc5w2hAqePnJYT9acMTUt9D6eSuLcYN+Bgshz4vov40zD6riF9LdzhKzu
         z7JGi+duQF/wMt7gA8lHCQhZNF2PH/mnlI7PPJASEP1xGSy2VlEL2Pk4L2hLx541ck5/
         zuRzEl0sfOpQCL9gdvNTxGdaSOkyLJ4FV5OdiChOL4IgE5Erc12kgjWBEDq1Yf5EARsl
         VK5ulQlk0AmAyMUyD+4AEWl1dzEIGPDYtGwZCKvf7U7Avctks2Jito8+1SZdkCsj1iYI
         56ag==
X-Forwarded-Encrypted: i=1; AJvYcCUhgmeebEdfXKtHHORzgiwYs3I5J+rh8/bdbOaYYPboxBB8Y5tq74PkROyjYBpkPw00iZS3PsN55rJi2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmJy7TDts01rdfdrd4VUBWey85G1rj6wqD+0LH/SodptM+OED2
	K7xC2kgV1aLUPNc6VQS4wa8/2Hq/5rNfECZkJU2FHmcF1CYOeHbSwgj8
X-Gm-Gg: ASbGncvpStKYbyp91jUWeEcJDRInfttKE6u+NTJq91v24P+HlnOqmVHbzmUgdTRP1+K
	IUPwBEsMM/e4TWyFGuWsoFd3Ay9ZbFYm13Jx+69bm6UTD3fIYy24TfJFI5Xuh+cNnYvpzVsI5Le
	eU5t5D/qhuP9zc6maAVagNn8F3G/L7/wK2AHm4mwKT6Lv8LY0ufbaSXtpA9Lr6H6iSZiD2V2whH
	8MPjdZUcWWz1P+whROOH/d3qyMi7v41x70c5uPFD4DcAQlIvX6mLR0KWmZFpdQYJkZ5RfGmVz6C
	jblblNkA4qYgH9PyJt2gSqk5tyxx1fXLqkBuu5+jZ8mOd/Z/AmKphrqUWu2nkzCZzI+iZM7LP3a
	TViF977TmSn4+rqzQyJMRccIXODdPvFCDpp8xPzw0n2OqZybGe21ShOi8F2kL6+57NJsTQgI5zC
	UD/3zQKwCdystDhgc6JcjhqK9UDk/XJ3tVIAbLqFhrAcetb2zct6Wi5T9Ddus8M/0zdxdN
X-Google-Smtp-Source: AGHT+IEEbY/WNAlAvL+pz8s7XDkjY8oak1WE3FbbRf2JSc/Ve9J9gkYo1nnN4xz8/yWauuSoOfnmDA==
X-Received: by 2002:a05:6000:2287:b0:401:5ad1:682 with SMTP id ffacd0b85a97d-429a7e59dbemr594649f8f.14.1761587922569;
        Mon, 27 Oct 2025 10:58:42 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df3c7sm15264123f8f.40.2025.10.27.10.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 10:58:42 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 09/10] arm64: dts: allwinner: a523: Add SPDIF TX pin on PB and
 PI pins
Date: Mon, 27 Oct 2025 18:58:41 +0100
Message-ID: <4686611.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20251027125655.793277-10-wens@kernel.org>
References:
 <20251027125655.793277-1-wens@kernel.org>
 <20251027125655.793277-10-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 27. oktober 2025 ob 13:56:50 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> The SPDIF TX (called OWA OUT in the datasheet) is available on three
> pins. Of those, the PH pin is unlikely to be used since it conflicts
> with the first Ethernet controller.
>=20
> The Radxa Cubie A5E exposes SPDIF TX through the PI pin group on the
> 40-pin GPIO header.
>=20
> The Orange Pi 4A exposes SPDIF TX through both the PB and PI pin
> groups on the 40-pin GPIO header. The PB pin alternatively would be
> used for I2S0 though.
>=20
> Add pinmux settings for both options so potential users can directly
> reference either one.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


