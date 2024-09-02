Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC131A302F
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Sep 2024 15:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725290977; cv=none; b=PTCpSl/ZtLlwuL10ocmNJmN+1Z4jCBbzfPKFHA0hjgDcU62LOnwogy5PUrtOo3kWF+9iHscwcGlOvrgV/Yv+UgHY/hxpLpteCA8ysWVParoxiPoJM24meV1Ny0m+YcKMeWopYcNSZVqMwM8qFx+EQ9PCdsfa0PI0tNnDH5Fx/pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725290977; c=relaxed/simple;
	bh=NrgGCBWphUa6pn16X1Axjzk9mG5BENYVNOkJJsvyqaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rcXl/VRXZP3G04DfcJUMmgSwPzFI9arkv4KYtq399SxcCfbo8tdf68XjKP7ucDLNdnTmyx/kP0EGWIiyYmDY8gyiZqgRcZp71N3w/c8Jsczs2U7tWBXGnAnkFswyWT27ulQU1tg6FFxmA5U77gfmX1RWQXAXWi3V+VsItycgjSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0IroUdH; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0IroUdH"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2d87a0bfaa7so2126551a91.2
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Sep 2024 08:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725290975; x=1725895775; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yn0qNt/zGhRL+OYRVXMnNoHz4+u9oRNyoVfW+1+Klb8=;
        b=d0IroUdHl9Riujq5coZw9CQ1Wdzt+qJXNL4fxoFdv+YlSpM2EvN+5ug7fr1sbQ540t
         EzEj/o5GoWzFDidvfLhIHSDV6HcvKRnYXjde9qPtz02DImfc1qUZ3jklU5fo6VN7ZnEg
         8ytD8T4I2VGfYxFKyqrX80iQ1zb+mKWQlOTJlVxGiLLL2e59cOTN1VA4JMNdcIb0hr6a
         dzlMLLDifhSExTKDYDtdfg/ybdmOkwvmjfoV0l+3UHr/rz+o9we2myDJdre6u9kIFE48
         pAjhSuhCx6bHEKrLKsf9zMc7W1dh7tQbHns1RYahWLbnLP04b+RHXWrAguWpIm8rCQ+d
         rXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725290975; x=1725895775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yn0qNt/zGhRL+OYRVXMnNoHz4+u9oRNyoVfW+1+Klb8=;
        b=JeqDqQwm1KsoKRQV/7WiHgu/s/2DZqmYUUlEWrX2aV8sRsm+q15Y+ICRDg/viGlZU1
         lqNlviYb8+gelPOCH2JeVVb2wZLxPZtWkw1D29EId4fVvazmMHK8uUKEduP9p40VGWWu
         HH3gN+k+bpjB2ZcNB4gZmT41+29SI0r+yhoZQHffLlXLSy5k6gVVtNEYZE9gun8Z8RQq
         K9qoD1kb8jGqE10Or+FzGgtFsjZuJ3Ke2q0UuZOq1N8uaKA8Gger225QN4ALsz8XjelQ
         pny/7BWk8+2uwPKpCK2EPXG8PrkZTh4XRLrDoCaufWUWaRLEwtVC+Fd5yHDGpqlgD8Ze
         lA8A==
X-Forwarded-Encrypted: i=1; AJvYcCXbM/dgTE2RNT+VRFmS85c/m3lUe9WtstgkCp3b+3WUihlyVsI50mQGWqzQ2aApQUEgSO1aYBwfLa6SsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh1TtsPX2ekPHCbroDCx+y4y3OiPzPcq5N2KxpTvjBxjUVs6BY
	YzhaHp4k6ISI79emuZy2R16J8ilyA1QTlQ3NlYqYr54kUgM7MLpbU+Z+rA==
X-Google-Smtp-Source: AGHT+IEk9g8G92Wts7sRMp4Y0O/AhNU/7/wNvFNT46Axmwo7BNebAS3H8+s8EdnF/SVM0hKlaq8kFQ==
X-Received: by 2002:a17:90a:ff14:b0:2d8:8ab3:2889 with SMTP id 98e67ed59e1d1-2d88d69e9c8mr8633933a91.11.1725290975082;
        Mon, 02 Sep 2024 08:29:35 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8b8fe1f68sm3367192a91.31.2024.09.02.08.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 08:29:34 -0700 (PDT)
Message-ID: <5ddb11d3-f001-435d-b6e4-2c4881bcd1e6@gmail.com>
Date: Mon, 2 Sep 2024 08:29:32 -0700
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 7/8] net: dsa: microchip: Use scoped function
 to simplfy code
To: Jinjie Ruan <ruanjinjie@huawei.com>, woojung.huh@microchip.com,
 andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linus.walleij@linaro.org,
 alsi@bang-olufsen.dk, justin.chen@broadcom.com,
 sebastian.hesselbarth@gmail.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 krzk@kernel.org, jic23@kernel.org
References: <20240830031325.2406672-1-ruanjinjie@huawei.com>
 <20240830031325.2406672-8-ruanjinjie@huawei.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20240830031325.2406672-8-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/29/2024 8:13 PM, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop by using for_each_available_child_of_node_scoped().
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

