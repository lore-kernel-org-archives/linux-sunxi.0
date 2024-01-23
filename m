Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525E382D71
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 17:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706032239; cv=none; b=TwBkhyafkmv82UaCl5UylSAu8sJRInBluLvBbISvQ5W8Ewntr8Lam2xs1dlm7q06QCKuB3Uap7y2otQJ4SqQLQU496k/yKnouoUZcIM7WP4cxvjfj07Sr6lFrdDKsa2vyH5+MA6+zIVuDNYGzW3wZcxVbh6U4TjbKgXiuhi0Anc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706032239; c=relaxed/simple;
	bh=vzbXOTr/hTcJB7Frwi93a5o2NZNJmUHLOIwRXVfnn7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vs4q1+RG/lOXZKncXAWUT8CYndSufTFw+DqGjYgzE0MB9+z5Nu+NKYu5Umg04sMMdw52L+cQcFRZIE9sJq+GQfBoVN1CT0M+cCPxiVnaqlKVSDU79wdbeV+ass4xrSn1yJDs4ToRx5xli/1hSxfvu7D1WpqphuRVjYP0n9VZV78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkqBlGAI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkqBlGAI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40eb0836f8dso19459185e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 09:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706032236; x=1706637036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqFQzFOYw01MT9nZZuoCXkcKWOvLnR25DA95X7Fl8/A=;
        b=SkqBlGAIiOpDu+yL2k9WONroXvN0pIsFthhC979gq03cQqECF/gGUuintkASKhjk0d
         txcZ3ECyx73IEVpXWB2OJTAKUbOgeSLz0lHwV4Fuovrz32I3RUwTgU0JwrkMMaIqCPqN
         rzpmE8RluakBO8RiT3Qu7Uc0qzhxNksr1cZIMPqYiwjuQ8PexJeXaTfMx5/X68dEuLgm
         I01BjJuXpItWFfdMpEz3znanHV5tCLtoHH/phJ3eeWPbTYfu3j4uGkG/xEOVIbEWi7hJ
         NlfK1L9KNVgMpgO+QlH/El8n9mW3cMe9h4JnZAMytgS+NhFegQ5f8VrN/NcNh84evLSv
         Kb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706032236; x=1706637036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqFQzFOYw01MT9nZZuoCXkcKWOvLnR25DA95X7Fl8/A=;
        b=NHjFk4Hw+/ppaAiJ3p+WXqQHvK3IxWM7JN8P1+qekfzeBJKihjT4Ck7pq5z2PiuWA6
         13ePDy3n5AnnfTTDBTn7G3LMxxcgYcpXYr6FUJ+HMBM39kCioY2x1XnpaSDG6JB0Wbyl
         6pBWD/PdBWEx920Oxbw0QMwlJkDSKRdE5nNaLNL39B+/5j5yaAoPFZVeG+r+emvhKBs7
         CAo3Jc3BLb4vUKbk0Y7fcPhOCbISuBAVw13YoHFgrcUWtDNdqd7rCjTkIjPv8pE71K3e
         XoXU6UEmi9pwdy4sBRuE7Rl9MAfsLZ38O3h4JdIuozzQolE4Jh3jS9Uq/o3ghlghkK5Z
         rMJg==
X-Gm-Message-State: AOJu0YzPbMEAPPAUp6dQqfFGMrDeYPKnfuR43Wo47D+N6NyrCbDW5QXY
	4JWpYgRl/dGgPEzrHzR1Doyxnxg1G5UtIYuMF3Y1RtQDCJOe7SnP
X-Google-Smtp-Source: AGHT+IEiz/ta2vrJl+XqiiC5CDVjxC8xoQM9kiT7Qfv/7eJ5lhHTm/bQV0Jzntqijrg4bnkk5MhVFg==
X-Received: by 2002:a05:600c:6a0b:b0:40e:3b1c:d3a2 with SMTP id jj11-20020a05600c6a0b00b0040e3b1cd3a2mr363930wmb.126.1706032236539;
        Tue, 23 Jan 2024 09:50:36 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id w4-20020a05600c474400b0040d5ae2906esm47418456wmo.30.2024.01.23.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 09:50:36 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-sound@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 3/7] ASoC: sunxi: sun4i-spdif: Add support for Allwinner H616
Date: Tue, 23 Jan 2024 18:50:34 +0100
Message-ID: <2254185.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20240122170518.3090814-4-wens@kernel.org>
References:
 <20240122170518.3090814-1-wens@kernel.org>
 <20240122170518.3090814-4-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 22. januar 2024 ob 18:05:14 CET je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The SPDIF hardware block found in the H616 SoC has the same layout as
> the one found in the H6 SoC, except that it is missing the receiver
> side.
> 
> Since the driver currently only supports the transmit function, support
> for the H616 is identical to what is currently done for the H6.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej




