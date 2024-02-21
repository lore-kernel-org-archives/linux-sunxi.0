Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FAB128378
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Feb 2024 22:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708553574; cv=none; b=GcROz3auBXAZ5gll5Sjf9O+t6/7sJfpG0NouGLUkOh0NelSrCg+kIrqUCCIVFFonVN4oqFkXkh/3h6DVF949Ikro1v/79QepD4Lz4UPX5TUr9QFXuJHX3JbkaNV/LYTnpeVxrAPhwr0geLq/H/eMv3Dg4/WrWffaaa/eqcMcND4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708553574; c=relaxed/simple;
	bh=RhFTKg9ao3rZOUrt7OqVKcCNafpR0iCJP/rDyRvJXM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=e2ACYimZDr4eLGTCsw4y1V+3jHJ/akkQKJzv642n9KyP6i5FPRWfKKAolTTcIlAgiAmUTO2utH3+MNMDo8ZTcf8uwoh7VvQpu3OXiTOWzJ9wa+2TR9Wehg7LHBoprCxmxVWmSk+pFCSxmZ3VMBWIlSzZ1GEFLD4sm0rx7/zdACI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krqm88WH; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krqm88WH"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso6980528276.1
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Feb 2024 14:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708553571; x=1709158371; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zvHohG/osJUUJ6MrbAQ8TEaNGcUB4t0Qr7/JkHGHUIo=;
        b=krqm88WH6Egrpb+jKSJhZuOGQRzMaKapTrGx7gai9duW0j0Wp2XfqtsXNhHA9iEyCa
         SngZGjTXGET9cfirYt05pf3vM0xfWRKbcK9rBghCKZge3oB8lwJBgF5QcBTU1Dd2HBDB
         +9pu3N8n4thz4W0kvpKtdqfpCQWZXfr+TCw59UD/gQjB4DwN43MMS54v3m1hfLHlerea
         iyocstK3CM+jXqFojU6r0T1u6RvfGKFnAdDaYkKju9JtmID/RsDsvm3bYw9FXHPMbrCv
         9HA4KdI9MXV2AV/lrBsTFGBZMmm6rHEOaS560idlYXH01yeCJ3FGFtB68HPqaT7jzk1O
         44/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708553571; x=1709158371;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zvHohG/osJUUJ6MrbAQ8TEaNGcUB4t0Qr7/JkHGHUIo=;
        b=lwKzB8yNJZPOZN0iS2aHeCq7D7mANdHAW/LlpX9OgXf6Q1NEtuttqEeX+qnP9NZjkZ
         FWF28XZyDceIWEFiFTD5P+6mlsrlL5TAeco+1h25yCSbLDEo/G2+It4uBYVE0QKHvoGE
         IY/SpJGMAk0vJ5FbUvxvkVEMc6t8spA+GYnxwoHCFka+pCElPjxB64GHKgA7Ki8sXi72
         Jw3oaJbrom04CvcJRn9MXYRAmddWHCVdkmgkVhU4d/nD+0cn6YHSQsU41/zZzqDQFAOy
         qwWCWOkUmZXL35AY9Q3OvzVUsWBKZLnxHycLT/UtPtP1r787JM4rwrXL/9O7kF7HOzra
         akGw==
X-Forwarded-Encrypted: i=1; AJvYcCWfjMuwm/dT6GriZBVgke3ERGR/M4eWc9BoW6n8EfwKaO8vAcyRPEW1YI0l/RIRw05QPcgCMWNpBWqOor5JUUVrNgfIBYweP93Fx3Y=
X-Gm-Message-State: AOJu0YxCQHyu6CpFD6sCVWUjbJ94HbBDVpod8tYhrQATw8X82g8FSMOg
	5wlrAyV8sU3Wo2NCxgZqWeqOexRc682zdDMpKcgRnOiwlH3AOQ5D
X-Google-Smtp-Source: AGHT+IF7kP+13CFMgvNV4rXPEp1sBAjlnfLwnWDRvHGUt3wwBoE4opoEpDnOPFhvcnuSrbWo1HtsDQ==
X-Received: by 2002:a25:9346:0:b0:dcc:76a0:503b with SMTP id g6-20020a259346000000b00dcc76a0503bmr692068ybo.13.1708553571608;
        Wed, 21 Feb 2024 14:12:51 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id i19-20020a05620a405300b007858c17df9csm4712295qko.96.2024.02.21.14.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 14:12:50 -0800 (PST)
Message-ID: <69a0df59-7d27-406b-b0a0-3e43f18b20bf@gmail.com>
Date: Wed, 21 Feb 2024 14:12:45 -0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: constify of_phandle_args in xlate
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/17/24 01:39, Krzysztof Kozlowski wrote:
> The xlate callbacks are supposed to translate of_phandle_args to proper
> provider without modifying the of_phandle_args.  Make the argument
> pointer to const for code safety and readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com> #Broadcom
-- 
Florian

