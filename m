Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C353318C00A
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Aug 2024 22:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724969810; cv=none; b=dbjqAPPeQZ4JfUi6Cir9uE/Qs5lur1KX0u0Dwsxup+npQZXJ5A9vQMjjG7kCPmnch+UWEQw6c+Uix6CY3tSPAKKIUpwJjAZNAwUmkTlEUF0pXuOPcwhzR3+LAeO+jMAkWJ/MhdZ7jDcMSCugkgHl+2pwNdH9grxw572MfLlDRw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724969810; c=relaxed/simple;
	bh=EVf1wNoMKz2uF2GlxsGjYPEDMW6Fe2WKaaS0DO4ekuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lG66v5HGd7/BmXPT7f2UeHnCfbNu+1M7OsaMVlTKiPw31EXR0bgLA6yzv/Rn/uNRcNnzL8G3TooPzGnSvHM9+7pJGwwhSoKclUGJ/5Lwef8DpjqCW1irtt07MPl6sUD1r5EELGGzXMRVTdliEcJmo1UiHR568ICGvevNiahrZXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=g+4R/ifm; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="g+4R/ifm"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-498d14b9b8cso365417137.3
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Aug 2024 15:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1724969807; x=1725574607; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AdhyFIR6wG8Nk99mcJa0o/LUoEn4VFkj70K4F1UtVdU=;
        b=g+4R/ifmcoZpri1wKvYy+yoWGDt26k8sH42W8+XJ7y/jhd40hygYGdysKLQfWEuLwQ
         UrRJGOHCcdN9b/wIfjfBZoSrOrnJHYrytYP6qpeyGy2lDo4jmP2jdwa/1UB4TfKG/H2v
         5R964B8GJ3bFaLqzWwUdddKIoM21noGgsMTHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724969807; x=1725574607;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdhyFIR6wG8Nk99mcJa0o/LUoEn4VFkj70K4F1UtVdU=;
        b=qOFMvBHqIci27NwdmksoXWbmj9R+eG7HY2pJx21CTkypZ4nqk/MwweIyl9HiUbqSKJ
         nEpu+L+KBB1BRhrixzxHc2V0dvBBxwJTTVlqLPCB3eMXmwShAXYUdz/5eM5KKbeKDGv0
         HA9uIrY+78QBzQ0Sd9yiyLE7tEPo5Qe3PzQITRFP60w54MqSFoCcW9IwPVqNWeW23UHu
         GjRALsWlQCXdxtX24zL3IpLMnFV2NNpcvVsF8bnMwSWRCQ6ySSjgRU5WhmHwC8OQqGb/
         eIWtDi5kDneniFKRWhmGnL4MS+TVjXYl9CDL4AwGE+GMvHLT7FhQpbolyuVLg41yp/Y1
         4Eyw==
X-Forwarded-Encrypted: i=1; AJvYcCX5QtgBB8EzIdZ9W24lnAhBTiuigd7L3zaqhZGeRNBXV0MXFPURd9xm7d0QzJwokRrO1QQLHO4JO6mSUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu3bzRnLusojjMkdo4JNZBShmN3VXOAEgVq+zn/TV8rX01hLsy
	ritHAWto5iSOIftT+9aC/NVwBjzz2JDarxCWQK9NI2dZ2CgtKl8YGpdjd5EuLA==
X-Google-Smtp-Source: AGHT+IF/GKad4GoNSJTieXZ4HSfQQ6Emya12RNEV/ApIr1wHYt03Uq4P4o4Bzr4FyKoeCXEIVSEvwQ==
X-Received: by 2002:a05:6102:32d0:b0:493:b3d8:bd8d with SMTP id ada2fe7eead31-49a5af78a2fmr4761465137.26.1724969807417;
        Thu, 29 Aug 2024 15:16:47 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340c96aa3sm9033706d6.103.2024.08.29.15.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 15:16:46 -0700 (PDT)
Message-ID: <1b701803-748a-47dd-a847-57a04488d692@broadcom.com>
Date: Thu, 29 Aug 2024 15:16:41 -0700
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
 justin.chen@broadcom.com, sebastian.hesselbarth@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, mcoquelin.stm32@gmail.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, ansuelsmth@gmail.com,
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 krzk@kernel.org, jic23@kernel.org
References: <20240829063118.67453-1-ruanjinjie@huawei.com>
 <20240829063118.67453-13-ruanjinjie@huawei.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20240829063118.67453-13-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/24 23:31, 'Jinjie Ruan' via BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> Use scoped for_each_available_child_of_node_scoped() when
> iterating over device nodes to make code a bit simpler.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

