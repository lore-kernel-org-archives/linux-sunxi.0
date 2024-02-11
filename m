Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A7E3FE3E
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Feb 2024 07:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707635704; cv=none; b=GKMj9CpZmtKBqWFuF60vrQTKJI4iOZ3Brb2vbqlW74LEUOo4R/Ov5NsHuGXCXX7rDOnnON3I1pLhzOv7KpyxVdZ2vIV5VwfSiimbUYXTOeiCQ0XhUAGuZ4uvgCdR8KL3uoQ79E+Oh3AMDNyhcdxbNJ0ISnPsoeItxV0nPL3wOXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707635704; c=relaxed/simple;
	bh=nQmMD2SptD35nCghndxGZnGfVOxRHsS0gRs8rfSrQnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JYNRYJta+aQtPeZYI0sWV7ksDOMKHCQ7wpLvAjT0HM6BYfdVeQG9ZNcxL5oWuuyOaofJtuXp0hzzIuMnbn+ptMOT6Szl9ZywzloV1o3BULS7qSkDaPs49TxO2kiAVKjqkw5ED9P9tMA9wRbkivE3zy8hk/g+aIub5O5fB8gEZOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/Svq9qe; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/Svq9qe"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3c309236c1so90176666b.2
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Feb 2024 23:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707635701; x=1708240501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s12drHj8rj04+GroOxHXAuF3MnK/ZF0RkJW4T41Khsk=;
        b=Z/Svq9qex+KGNT7eMhqdsfqRqdavmHhx9bEqm35c9Mr1bU8czWfqDSL9QHbHd2GXd4
         2wQhTwV7qGEhDuCKEAQT6l+4o4GG0V/7qTsBIYUFAVGNdHUN4p4fijIMy3ORh0GE0q4w
         dC6pLcff2sYXnNl6/EjEqYKHlHox4bW6taiiVYTsvEJqGYt0v+vUjkhVujXAJQjm8rBT
         wYYJqsi6W+lHhSMdfoFIk/SxyowTz4FWoW6UJZpKjOl3GnBPTdXUb/ddXqW+iAVJ4gnC
         GSGl+ilnvZ3ngmY4gSqat696odeDls9lQktG4p7bPajEsAUitjwHmlWC+EiaiyM11XBq
         RwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707635701; x=1708240501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s12drHj8rj04+GroOxHXAuF3MnK/ZF0RkJW4T41Khsk=;
        b=CThW4tLIWbA6s8sR1/55W/cAfdW7jzVV76aDfJsxPLLGbuclL3i5GX0FD7NUjhQWrh
         jKNRKtAbKL4rHT5FBrQ61/6P+lmnkJcYsaGTM8qNk4iCF+4kYu4rQwQWv7kMjfZg7eLJ
         Jdt8uHsWEKCs2eQsVryVgbkmzhvPo43kzn9rooMXNGN/sXyWzYH0S9xD39v2C8OisBPV
         Li1TC3g5e6LSW/rVlwYyW/YIE5efojOZwDD07nlD5DoQsTJZK+qNcsIFrxqAFTgBuYuz
         zFsLj9+3y/4il6nFnyYnKk/0d/Rk7jMrZxJGrhFFrhdorpresow+V9oe2P+wEgZmFEna
         PsdA==
X-Gm-Message-State: AOJu0YzUAnzlvQIBmUApDtSA9nMI1diRFIxist+oa14vGqKjNc8OVoXs
	6qZHHCcLYu2PBG/CZ1hlyRG17cad23RuWSSuaC4OPUeo+tYwQGIRhAt6Qc7u
X-Google-Smtp-Source: AGHT+IHx17me+VBcKI2SHqbrlalGQZ9cBXxQIeylmjN+xWS0vcuJHRxDc3RzrIhvi6DRAAsbyITBUQ==
X-Received: by 2002:a17:906:11ca:b0:a38:7171:e832 with SMTP id o10-20020a17090611ca00b00a387171e832mr2646883eja.32.1707635701158;
        Sat, 10 Feb 2024 23:15:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1B2BVyGTYjcb+HSx/MArU4UVP4S2nUXOXZnenKTB4bHcPx8NjanSTBKDXV25fHOkRKacTlpJ6tLjnZD1mWV8rkS0TBzb0OhOmiFdf1rvIJTPRI7fnbW5bpbNMaffnXmG9cya9RjmvRUGgZHFVYfiHkPZ2mPtWtVpcoH8ewrcnltV3TLYR/G3x1emOak4hQFLH89XLw0/2aydJFgFF3B26tJs1EGXtTHZV4qdlb+OlPE9lkmgqXuJxYdaEFcN4rdBkZZjKAf+7PJmMuVXTnvvhKrhfeithpord8v9KayFbliXDuwY=
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id v9-20020a170906338900b00a388e24bd2fsm2585713eja.162.2024.02.10.23.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 23:15:00 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH 1/2] arm64: dts: allwinner: use capital "OR" for multiple licenses
 in SPDX
Date: Sun, 11 Feb 2024 08:14:59 +0100
Message-ID: <2720166.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20240208105301.129005-1-krzysztof.kozlowski@linaro.org>
References: <20240208105301.129005-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 08. februar 2024 ob 11:53:00 CET je Krzysztof Kozlowski n=
apisal(a):
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


