Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F4C166F3D
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 09:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737193809; cv=none; b=C89FZIvC1BQIe+7Pwa/WHAu9vfCAFGgZvsixzz6cea87P4d+q/I6BIPkux8w+qfmCydITlKI8xpyFNk5phXbc959qmYXUTxPxbh5Ch+lFmA1nmr41T8Aya9TZdSH+g/f2DfZFEsfFrazskd31+tmOKtWo6Md7HCkAcO1jdVxbx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737193809; c=relaxed/simple;
	bh=FhhPsyyyRSLm26HDZBn+CWRZFfO6+xG+OhBZMJX9T5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ScXxs3NiCV4N65Z7la1BvQL8tJK6dZZyRSMDZhwlNlF9HXLIebPVd2drnbT1s1KM/R6335go7gUXBBwX2tk1qyP9UmIf+lE+jkEIwVl5qqgZ66YqVZNV+dy5PDnodD6E+QM/PoyggRoLTtzT5AL3Kqn8HBFzOTMse0r2ZLSNYrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPT2kItH; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPT2kItH"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa69107179cso570397366b.0
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 01:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737193806; x=1737798606; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhhPsyyyRSLm26HDZBn+CWRZFfO6+xG+OhBZMJX9T5g=;
        b=FPT2kItHFoNa4O/1F+4RkXIdbSWDr8qt2/3Z3YI1+whu0H4dy5wq8mmhbxsUrGNMqJ
         b6XLDsHy4Gvkv/dACvjvL32+oMT6IyFL7skjTIkHs5OtUJEjGSbzpbi9JaperAyHUl9z
         Ux27vP+bqpQLJdOk7BE5NqTi9I8NyRHZmyebun138kHJIWQJegWDW+SQJNcvGyDU5PxM
         4oOnWftHKTinBlaeMdL0tMTGmyD5KjlfLGtw2cIK6sHY/Hxqg1s6JvCca1EHszU9lq7w
         +wB3b9FpBMWJoIWJvmxRLKzWCkjyqGyh8kwRrahBPO/nNcgWP4cbakjLU3ke0GK0qDaJ
         lW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737193806; x=1737798606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhhPsyyyRSLm26HDZBn+CWRZFfO6+xG+OhBZMJX9T5g=;
        b=RFTl8ST09GxDkf8MI1GCG8kPSOXBlGPCag1NGzdhMhgLl+anpQ9apVg/23ujNuTovK
         cLScaCqQvRZrLFAdxLqrKDa/z74ANjujH7gnkkMsgDEDrgUK6dOx/AORvz7IfHPvTizi
         o327cEc5TVabohEkKr30SfLfSlNgPzp2v8rbzucWkCjg0KYZWYRkcl7/vPeDTmnAVgSb
         yBoPHpBXrbUVAEgO+EsMrs8TJD6j04FsxUF86F9m5t1knJJE5RAc9F6UXTvHdRyzdkMo
         6xlu2+DiEl3XbUGxN81veMH9ZE59/270LW/zoFqmVVFU9raQVLfeuOCK2xQvg/+/FTFI
         JlkA==
X-Forwarded-Encrypted: i=1; AJvYcCW23QdlWOngU6Z5ZUa9Itd55g3Ae8Q/oluNF2xoXaEOBcoW3wnrP6we7KOIqQk5CcFV4pXrhHer1Aq85Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPLftcyBvtBlFHAgyySztfrxWtJJqUhc0RmWv9J+jIZH/49X5k
	TX1kkfmSpA/ix04GEL8Sndp4bnkY+jb3zLFM4DaD7LuH2jVPa8R6
X-Gm-Gg: ASbGncv70OjAyQmyY+HhhxjVWkAcpOoMtmOb0NxFaAAuGiiRWbJ+ycfzQ81SO2vtUiq
	z4jS2sd2TOOICyIReu+sLUatPCG3VqF5KNhkbZ93MhGnYeeJ0gYKFCq77Z0KEs6ga96v94XINSI
	n96qf0d/SYjING2quF715sPmb1anRq17K70AbOCywQT21RwNu8bfpX8Jz0mym8tOsZ8mxgn9CH/
	ZqWJB7SSSEQ4w2z2sJZTSm6OcpAtXw71tQhVJSD9eUU0ne88j9ysC6k1paN4RGy4AtFaapnfGY7
	gJSzYHd5n3K0ni4=
X-Google-Smtp-Source: AGHT+IHaNlcsc4OEmrt7TiQegOYBfODCrIraAE0UV1fgtoWTxbEJfDVj44pe49R0MuM+IUWNGY0pXw==
X-Received: by 2002:a17:906:fd85:b0:aa6:becf:b26a with SMTP id a640c23a62f3a-ab38b0a13e6mr479360966b.9.1737193805433;
        Sat, 18 Jan 2025 01:50:05 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d2d69fsm306520966b.79.2025.01.18.01.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 01:50:05 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bence =?UTF-8?B?Q3PDs2vDoXM=?= <csokas.bence@prolan.hu>
Cc: Bence =?UTF-8?B?Q3PDs2vDoXM=?= <csokas.bence@prolan.hu>,
 Chen-Yu Tsai <wens@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2] dma-engine: sun4i: Use devm functions in probe()
Date: Sat, 18 Jan 2025 10:50:03 +0100
Message-ID: <2217419.Mh6RI2rZIc@jernej-laptop>
In-Reply-To: <20250114100505.799288-2-csokas.bence@prolan.hu>
References: <20250114100505.799288-2-csokas.bence@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 14. januar 2025 ob 11:05:05 Srednjeevropski standardni =C4=8Das =
je Bence Cs=C3=B3k=C3=A1s napisal(a):
> Clean up error handling by using devm functions
> and dev_err_probe(). This should make it easier
> to add new code, as we can eliminate the "goto
> ladder" in probe().
>=20
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


