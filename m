Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5551D61A3
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Mar 2026 00:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398260; cv=none; b=BYPe6wvLbhxi4k6uTwv/kdfHCL5wAXkUgM6ilpYVHXU+vSGiRl9X1nnVssBWBdCxv36ydbCbuk6SkT5eHnl4ACWSGysMMPURPk1jUBMSZmuXUgUYrR2iwPkz186oTyetAmzvTheMAkIfaEMMDTgsxQ7CRqzeqsEMrqmuJ5blRQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398260; c=relaxed/simple;
	bh=y9QUfBbiO+kjiELTZ3KNnXYoTbhjP6AEc0bBAmqsZ2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=miA1RImzKQYkyxiqTHKElHFs02a8oMqelrMVUqP9nAYK7sOpmj5Pc1NXUgGmVEX2eBmwwFzs898tobBV2nnKuQ9NZvBkr0Jb4rLZiUzHeH0rTVmev5MYVOCm2xeFeQ9zx9PmOfOSSBsYlX3J5z09fPyGRI6tFFgX88flfQ42nZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtxN/Ocs; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtxN/Ocs"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cfd122d78fso706865085a.3
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 17:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398258; x=1775003058; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9QUfBbiO+kjiELTZ3KNnXYoTbhjP6AEc0bBAmqsZ2E=;
        b=GtxN/Ocs243JRYoEXgwhVtItMFJIPogoWT5+AoyBwrW4RCeRLGdOC115BDUFz6LGL1
         4zpmjcoJCXaoUVr/1slOUIhj7q1gJeK4WXwNtyYcKASGcT3nQaWQ0ghDRlI51SFqSZEw
         6nDVmFgVpwm3vkIeeUZdnnPnUpeuLsAFI/Iqj+8aF1t7pZwYNpMhpxS8KzVUZuRIzjXy
         HAMioVQKsIBfhdLMDAnAZwaLuGqliYWsxli1xUD1d8W1iCIpvnvX4hZNLTMiwFk3LTBp
         JF1Jd31MIX3K64m6fY7wkVxSC8JbDejn6+DzEWuLb38OMudtnvSrJ8craHkxpm+5T80V
         lAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398258; x=1775003058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y9QUfBbiO+kjiELTZ3KNnXYoTbhjP6AEc0bBAmqsZ2E=;
        b=inppTvqs2NVS+0j86O+7Bg7KKmaWqxW08fiNXIiOE+TT8UckkOPFQy4egoX0WjbNZ5
         yjP/HPo/ljZa53UjB1lIMMgeetjisJDJXisGdf2/kKWBRoNk8eRiOv+RjecPYMOxqxji
         5jvWUQWAzG6DHCx+f+lInNnwPGB4k8tWwr+1aJGFxarG4nDb8f1LPJxqsw7aJa323EZm
         QLU1IHAlpbVXU5Puazd/HJNEXIaSYW04mRX8yWVaDtgAieFSlwnDFLSJxWHWEWFO52KE
         Plv1ivjB8CeHcAK7ulOm75DhAGa2cvf9TuLU2e5A6RWiCxhacWjGODrnW54ocu7lUswR
         vxGA==
X-Forwarded-Encrypted: i=1; AJvYcCUfrz7hfdI0KSGOhtXZ4kJxhvnTm8YeR3yX3iwAqX2VzrtGe23zR4eDgbzLvaiC4jREUUf5TryaR4PfiA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yykb7TPWknAMj4MTaEuZPuFLNR/NXHU1crK/19rf6tqw55DJ4no
	BVsImmsoRc6Xk5ZR9LghQZXSA+MY+hwLTUlhU61TyIU1x8eVRu35p5qh
X-Gm-Gg: ATEYQzxcsVZFmRaT5gKZDNDdRl+OsUL2Bg/GyKlTVePwJ7Q+3EXERocSNT/tD5vmfuD
	lAMuvOoezHPfp6fOZ9AvpH8ro/O2ZJwwnVpaRFse7tT5ZBdaaI2G4Wrn3QSfGy/5gAxfQtCVx4R
	kr89gfFqSMncRg1gd3Qz44KUG2BroFLH2lvOjELzyGYJDSL0INlVEt2a9BRTedBwKYLbA3URcoj
	T/S2xMhIgFnGXvdo20FUDWoeNUDv3rS5RRwYYdCuaoaRLJpCnoCYO0NSWrOpny78/aqwNYEiyXe
	PQ2z5ZWOjdMY2a7iVjE9g1fgJcv5pNvGdOhSt9FmfnPqQXoG6SP/h/+CuQWafgSrRk0nFAi8t0T
	omBrzr/TTu65M4ikw/++T+Pa3Mt9K9SwHr6uToRuwXcvCLZiTIV52rnlm/g3J67g0mcFL12cTmV
	4a7I0FzvrM1eJMsHWCxQelbbY9ZGjXpUTQYkWCM2mthnpMRfnBPYe5No5Pz1Eoama1qtrXZjvZt
	TmbSH17ODP7nw==
X-Received: by 2002:a05:620a:44d4:b0:8cd:8ee1:2eec with SMTP id af79cd13be357-8d000e4ab6bmr239394285a.0.1774398258039;
        Tue, 24 Mar 2026 17:24:18 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8fb9c10sm1375930885a.19.2026.03.24.17.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:24:17 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 3/7] soc: sunxi: sram: Const-ify sunxi_sram_func data and
 references
Date: Wed, 25 Mar 2026 01:24:15 +0100
Message-ID: <8657193.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20260324164357.1607247-4-wens@kernel.org>
References:
 <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-4-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 17:43:51 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> sunxi_sram_func contains value mapping that do not change at runtime.
>=20
> Const-ify them.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


