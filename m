Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B18112E63
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Feb 2024 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707241720; cv=none; b=VhOPlQR4YQolZkXexdaQRCJSlIIDnroHTGghV15b3YVsxqfhRtvb1fAGxWye2q23HUtDgnUTzd5o54FolSwq6AHfEn1jUc08PtRwq7ncx9BppEox9+1MC1oq0gMRgCE1HGjOqR0iM49bRXM+UqQuFPNeswqlkSu/vMpOCkUN+DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707241720; c=relaxed/simple;
	bh=j0zD9gFLpDaXaJbcOjoS2R/x7tRjwLTTsNmLaeDslac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HJxMSYiLb76DIU9iQ6GNQ2iAe+QyQ3eUDYdw7dqUqlo3NywkBtjQFGlLscb4hW7rWGMCs2KxEF6WB07HIpwfSGU2rDUnYAGrbdlOcYV93SpapJfqZ6j1+h8oz+yl7JMFfT53JTpGk4BwZ+quiB640hizKUXXfAzb2GlJTgdN6Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aePnZLUW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aePnZLUW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40fe32fcbdaso7310775e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Feb 2024 09:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707241717; x=1707846517; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTtEBYn5HMxfoNFDDbyP4zpk1ZUKqPIq9B1e4+8nGHE=;
        b=aePnZLUW1PBXEUiZeTar73r8w2S1kK0iRSDrng/rswqm7l4sybz6TUUQQ6oEha4xXV
         M0Tr2kkfQv/rtukirSL3YGVOYN1HOhGaiCMWQSQ/i99BUwV930HkqaXiZfyJFwKWqOna
         rIQZZ9vLnYvcW1o1ufPwPosmeJjdIyZdpEtYPPoYGow5S4sHn6QqaFPtSIWwSe8UV5Qf
         P1ZRTSjDobQnPcHV2AR14JjIB7cdVMTa00pc9L+0rFin2Toesv7n3G3+ZoxEPKM9H3H9
         xyUYEN7xyD4QWw0kJpA9IagnJac/7u7r/nw9x9ul5IcOmvRnjeChsTjw8lfF+tRatZQ2
         sRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707241717; x=1707846517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTtEBYn5HMxfoNFDDbyP4zpk1ZUKqPIq9B1e4+8nGHE=;
        b=DA16aW557Dqxzig8KMoYz3V7l3wrHGJMRjAfFNLxqD1ZhzZ55RNwC0gYPSeC+2N8D7
         ZUq79QM4MwgmXuvzRnJncUKexXvnlBdkoWbTP5xhF4/vyHRusl2zIUEtrqnbqed+HBjM
         b1o+QDjgnYHRJWf+7xbaJyUDYqAA84RTpt+PyQXuELEGTp1MxCfq+FAewEpjbEuDBC7s
         Q6DLzINQK4NbqnNaeJekBs7RNJsfnEjcMNKMoPJQOOWWRa9kL4a8s+wtO83QFcOp7F4e
         N7jy9x6BkxgVagjjWWTAmYnbGB1xVQm84EglY4eY6zqNOJHMhIiv6P+Z3/DfNDsXWinG
         9yaA==
X-Gm-Message-State: AOJu0YxhBx0bW84UEeuhzy2sUOTf6zuLbZbR/igcLmNUTng+6whQ9t3t
	QzIVGndeuirMWdM7Bc53f/Ebv0f7pYspc0UAO3Ev1N6XbJwbaa8H
X-Google-Smtp-Source: AGHT+IGOnCyT6CBuMAN3BVwvf9J0QHYMBB9K1MogSD8lzJNn9y3SV+aiYmuCQulFXmj2KgBEPaPtWg==
X-Received: by 2002:a05:600c:4f15:b0:40f:e4d6:7ef6 with SMTP id l21-20020a05600c4f1500b0040fe4d67ef6mr1276507wmq.23.1707241716697;
        Tue, 06 Feb 2024 09:48:36 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWdx42vPGXJ/UEcn9lXXuP+0jw/EUKC2rpCpUtPkQ4Fiwux+9S/V1KU1MI2bX8wdgVppO//VyQkqtrjdMKXi4s6WvbjdAOC1ZZixK8yOt78/+MMj+DnG0sVRYj2LJ3L9dFKYwzmwslBzyYE/43phc247FZXJCzG6dCgU6j3I01lxNQ0lKvah6lLudHCAvafWniUcwv5SNDIfcFvhoV9KLM50G7BuOZtIvPTgi002AHSqaO7RTcMLY9eaxWf2crnQk81B8w7W7tk/N+NMOU9+oHEeVmQxDW0lx5bXSGYjx5NiuXT3WsqLEdNwR2UOxpvoO2MpydAdczy3IPD14PWJStA2BokxP8jpDF0I+kaHCp8bXNYRxyoyIk+cfvtusUoESNzqbNafajLKpGCsXtFiIoj+7rW3B35EBtsJEIh13DaTkN3zSB1vjk3QRl0fKUImNqa3B3A8e0eaJKWfp6C4sDuEP6jDbG7oAu6BYCdnPfhmLfm1q6vgeKQUV86ycihD6JBoRbxD0nFPuel+OBULxMc1+ToOo9nDeIW6Fwv261ehn4nlwUWMh4aN0HTM73B6TRMKeluIrUSVWcnV+O6b2VcSFon4z43UTsF0xhDP5eYEozSy0BeeIseemxTXx9fBx8xqTIXlW+2hcBcCEMikn4uOuFHit98KI/LR8Ier6jDA0aP4HwbIZ2ftD0cpVO2OOjg6sUXsiCV1F1Z+FYAFwgbTXvqsYd7Dwee0EDTro6KPMuwdaFwvvChv9hyke/RjMJk4MpJNAwRPw==
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id fc19-20020a05600c525300b0040fcaec04b8sm2676064wmb.22.2024.02.06.09.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 09:48:36 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>
Subject:
 Re: [PATCH v2 2/6] clk: sunxi-ng: a64: Add constraints on PLL-MIPI's n/m
 ratio and parent rate
Date: Tue, 06 Feb 2024 18:48:34 +0100
Message-ID: <2922005.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20240205-pinephone-pll-fixes-v2-2-96a46a2d8c9b@oltmanns.dev>
References:
 <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <20240205-pinephone-pll-fixes-v2-2-96a46a2d8c9b@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 05. februar 2024 ob 16:22:25 CET je Frank Oltmanns napisal(a):
> The Allwinner A64 manual lists the following constraints for the
> PLL-MIPI clock:
>  - M/N <= 3
>  - (PLL_VIDEO0)/M >= 24MHz
> 
> Use these constraints.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


