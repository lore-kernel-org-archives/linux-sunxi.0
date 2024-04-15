Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF0D156F4B
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 21:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713216894; cv=none; b=sAOKmw+0fwaaiQ6khQkabdQ3ov4ENoB9RKp3uG4EGCAq0cXDyj32za6QEmd3XQWHdVxvbe06QZMEYfEysQI8E7IMFWfitYgn/NPAUfoHAy5rUeJdcc2bkdZ18ScSNCAAeiSVc/vTqT5wZgqnZbIwmcuQHA47nf1MaZz30RphGig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713216894; c=relaxed/simple;
	bh=YcBaD99GoN6AuooIAKX/irl2Glt24VolMzRvwDnXKSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jUueJiOtYdxYQptTW5KA8YuPDyxh6x6cHZSGAbbrbJ4FKRq8a14hzyDsZA+yRgIZZTGZmvItt460mEFubrLMQRa/DdhSWSluEQRNidNknkspL/BXByTMkQQ9MJ94E3D6r5asALasLi0B5XA2CaNG1UEx7kGVoYRmTcDREqc4ua8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXR7Mi9k; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXR7Mi9k"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41884e96fe0so3629015e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 14:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713216891; x=1713821691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MngAaDFVN1bHp4jdNB2FOwRByqVy5DrODddXtj7GEQ=;
        b=ZXR7Mi9k5GZ074CgMEaq3oq9U0+kn//5PapQdaXwLYZdfGtG3SKXSLV+MN0ZSxPCsD
         4XRjz2Kp2YpTZyWCq7T+s30RaBo8Jt+WqNV2FMk3ZAkzG2VIsI6RtxQHbFmN3/S/OABz
         qBCOgJLnU5JjZQzxrsJAkg3t8rOmM3b+OQYlo7yiiQNzMtx0Re8Guzdr9CVEk9Curxk/
         /7dV6qkhCC7QM4QzAqL/f+dhmYKnjTjiW6ovWkeAUyQVxus0X1aNtBEW+2sE2cGOMNsE
         FrEpLXq8VSaPgU1/Rb6f1jHW0D2pL6KYYb7KJKsVLxOQTFwUsvzkitVD3FW6tidTvMbJ
         QA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713216891; x=1713821691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MngAaDFVN1bHp4jdNB2FOwRByqVy5DrODddXtj7GEQ=;
        b=L/Qkto27jboRTHaljHHoRLcbgMp5CePq4Ruh7kAQ6GdEmLuxfmy7Edav46n+D62Ytx
         nUWZKaMjkQrfuJiEPni4JhoUXX5UJZIcu5cqGGEdT5+nIzB3wVU55z3eDI88xeFZo5HJ
         sAWORy4Wnnurt0eaBiMBX6H2jhv4RZsQcLapBcqHzKJJXqbRbcpaH8qfC89gOO/rMo4z
         Ex5DbQcmKpySAJZ5wOosZC/gJ+MsRhEXoHQebxbVIH6hOhq+RJ0R3Lw35VcELikcmifS
         fWkq/esZ3LMP5dcvDue/nIGJlb/vEpvtyQ/kIpcR9P7vmKvZlt4lRHRAEwIrN+nRbNR5
         ANgg==
X-Forwarded-Encrypted: i=1; AJvYcCWCG5ZIhX/CravS9iid0MXM0G1mQemTTCZ4YVl8m/mBSEVZxRPErZ8t3pdv3DxJcjrh6h5anOSrKfH/SDIfH0DCfpXfZtXFIAb88yY=
X-Gm-Message-State: AOJu0YwvjLz8S5uGBb502zpVeydISRY05PIf8FpYbCTnJkrZCKoPJf2A
	3NBs8az6h9wDTSr59+IlwraeT3MBjMQzNng0UV+xDI/vEBLOrGlM
X-Google-Smtp-Source: AGHT+IHO0UydirU0frcJgoHgsd2d9A+XDIfIqbidYVQXXd9jmDbZT1co8v6u3rH+r5lyoWlHcu5gbw==
X-Received: by 2002:a05:600c:4749:b0:414:12f6:a105 with SMTP id w9-20020a05600c474900b0041412f6a105mr7619233wmo.5.1713216891306;
        Mon, 15 Apr 2024 14:34:51 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c450900b00417e01ce03bsm16613050wmo.17.2024.04.15.14.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 14:34:51 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Denis Burkov <hitechshell@mail.ru>
Cc: Denis Burkov <hitechshell@mail.ru>, Rob Herring <robh@kernel.org>
Subject: Re: [RESEND v3 1/2] dt-bindings: arm: sunxi: Add PocketBook 614 Plus
Date: Mon, 15 Apr 2024 23:34:49 +0200
Message-ID: <3476347.QJadu78ljV@jernej-laptop>
In-Reply-To: <20240415173416.13838-1-hitechshell@mail.ru>
References: <20240415173416.13838-1-hitechshell@mail.ru>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 15. april 2024 ob 19:34:15 GMT +2 je Denis Burkov napisal(a):
> Add a new board name.
> 
> Signed-off-by: Denis Burkov <hitechshell@mail.ru>
> Acked-by: Rob Herring <robh@kernel.org>

Applied both, thanks!

Best regards,
Jernej


