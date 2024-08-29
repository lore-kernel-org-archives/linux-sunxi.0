Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F88189B82
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Aug 2024 20:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724964856; cv=none; b=EFWHVNM0o2IOQf12ZZeP5ty+lbn6OP1CFCsfa6edcvrOtLQmPy2Ec3mY87sLEyTzo5kyRFGrvbnshMmcc/ckV+tmEKAVV4mkTIvNd3xST8U1fAmT4Wuxe2L5IfZ4eVA0yPaSx+rll0g5aq9E10hqi6AVTlkoX2oesWVrXNjgAFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724964856; c=relaxed/simple;
	bh=W3QXNggGIlUka0CLektfw64CDNJtBPtY/C+13Acr7YI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KWn7Nx1RMGFxsHtGQ5jPvkvX/l7Z052Or9dCzUef7OIW7rZqA7EiItVOKtO6uJocd2oBTlZhc3+LcqW8YjXR6wmHGMgGOxEi9yOs0jpSvrsFbuZQ8depb0LIOwa4YhZowQABE1UXNgVxnVAj3v+oFP5adbCdOpfujwYE4dfHp9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=MPJzT0xn; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MPJzT0xn"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-201ed196debso9599025ad.1
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Aug 2024 13:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1724964854; x=1725569654; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bpAKIRUeMQ69akkagQpjTbK7bpiP+z/aYeOQSNNIjDU=;
        b=MPJzT0xnpCPqiS81zNfHDf7+oNvD3rTFdeWlb20yrZGKMP9XeGVLf5m+YIHYc/yoJv
         5BRybeon5G+0TtOEIJs/hJay/q300eziqnsoqhvKeW/cGuxu0EfAiHUkFfDKI2kuTBVr
         z8YvwJjkjz76XZWNlVBzlhaGMgLcuNJZUqMT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724964854; x=1725569654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bpAKIRUeMQ69akkagQpjTbK7bpiP+z/aYeOQSNNIjDU=;
        b=V6L8QtsCHHP4YJiCZmRTlmf0bAnF5yNUPj+dlschBADTrAySMTih7O9b44NuQ4MDMF
         CnKhZF9vylfFiAHYapLYjf/pC0u9yw8Lp+4bh7XqzG9tCKcVOyaLBy7HW/Eb9QPeyfmK
         A+QKA/cL5KpTE2/ljiYJyg2bOxqOOQ0WKjZnlp1Hc0GFV2FTGIraXZMc1oickhlcYaVa
         snBy4iWWXg1JPZ+M9EHQOL2FKs4QR1KAdLDGHI0m/Xd9idy+FC/vnKYwJr0h8cXYKEjg
         kx1aAgYhhQhroKMWMWbgtczQLTFnTWGQ7258IBDRxZUpdZesurXJWsB5HlnFgsQ8pvjE
         KFuA==
X-Forwarded-Encrypted: i=1; AJvYcCWUb0mqTnTV9pmLKkTHYt4qDOjVJ7zFl117pCWnHDJHngcD4E5GSX5Z8i33WPL2UCSiJqkLzRoV8nRXvA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5VHXVTQwAuBhZPEkrXqqhf2F9bj2+oyyLxQ61sPUDX65WN3KT
	3k501fYGbKvk7d7Iq+LpLKFAxIS7KdQOjZADBaMlih0JPrYvHIntl/sBi/E4Gg==
X-Google-Smtp-Source: AGHT+IHWeXnhZnpNG3JqVZfHM2kILTImJt5gTQEIEKE4/lLhcadSeURX0TSadr8q6vHOf9OlWw3tSw==
X-Received: by 2002:a17:902:d505:b0:204:e310:8c7b with SMTP id d9443c01a7336-2050c3ef5dbmr41235765ad.34.1724964854292;
        Thu, 29 Aug 2024 13:54:14 -0700 (PDT)
Received: from [10.69.74.12] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051553720esm15596495ad.178.2024.08.29.13.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 13:54:13 -0700 (PDT)
Message-ID: <ef15f1a1-266c-4aba-a7ba-b7bf56fd20c7@broadcom.com>
Date: Thu, 29 Aug 2024 13:54:11 -0700
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 12/13] net: bcmasp: Simplify with scoped for
 each OF child loop
To: Jinjie Ruan <ruanjinjie@huawei.com>, woojung.huh@microchip.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linus.walleij@linaro.org, alsi@bang-olufsen.dk,
 sebastian.hesselbarth@gmail.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, mcoquelin.stm32@gmail.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, ansuelsmth@gmail.com, UNGLinuxDriver@microchip.com,
 netdev@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 krzk@kernel.org, jic23@kernel.org
References: <20240829063118.67453-1-ruanjinjie@huawei.com>
 <20240829063118.67453-13-ruanjinjie@huawei.com>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <20240829063118.67453-13-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/28/24 11:31 PM, 'Jinjie Ruan' via BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> Use scoped for_each_available_child_of_node_scoped() when
> iterating over device nodes to make code a bit simpler.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Justin Chen <justin.chen@broadcom.com>
