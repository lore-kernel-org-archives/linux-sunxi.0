Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BA6224251
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Apr 2025 06:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007182; cv=none; b=m49WAPtMkqdTOLW8afTQhKRDMg62gyWPqeaFHjIBC9aONY6OooJ9+Q1gemvHbCLafjtFGKO/FXPYHuUnReVSiWpQZLXPv2HqlA/PBIen9raXSi5GnGTmG4nUY0Nx+KlT8RAjORIy/7clhjOAtLpSd9YAcHL2fpzIZThXbMYB0hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007182; c=relaxed/simple;
	bh=k8YYOPh/3JkuLOMn/Hj98STqPu3UvcIJ1IzVOh1TAOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsJ92awq78QcSgGJb1zhxISzzBfx80LoxCKpmu/SqcKPj7eKsA88atrBbbDU2MoVYVw98qI/AJKLblajWn00uWW0fYDk2k60AwwNqsIYlnLYtcbwXemYdlQqQmuQxXWmU0hM7wdP93NlMOXjxzNoBk+HxmAuGAoRKuKQsm3SMOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKH/Gazy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKH/Gazy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf848528aso32593175e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Apr 2025 23:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744007179; x=1744611979; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7vcZaHtT0Bdp7jhNpBVwgeNyTw0QbyKnO+4kb1PkgZw=;
        b=OKH/GazyneKbKK6RVd7w0qL/JRfNHm2SWMC/2/kueR5DSlKluO9ZkglVH76zxAsNEJ
         /L7vuA/XbCgy4Pa8NvkUZacHSfJhx3UmSxu8bMMYw0wxx/OKTxlLx/hu6Eck/elafABJ
         RtTil+U0yk+g7Epw/fH2iHtXjAsjwmf42glwKkCxo22ZrjFDyQa0g+yEChLF+kmUaRPF
         bm0u5dK6jq7KD5qrIy2SkYCDK7D3OVDeDjatWgiS1ykVwC5yFsQNx0wWqGrqq0f7TJYi
         js/xSY5gvxr4O7/4hIBalbT23qDFB8Mov7HH9OXRgPeZYx0PqPX79fO5MKSOr+Qf38bA
         F/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744007179; x=1744611979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7vcZaHtT0Bdp7jhNpBVwgeNyTw0QbyKnO+4kb1PkgZw=;
        b=UXpzWcmZHzTww/3qo1BlGEdp6w/SE/rR9uD5VtJEXKE0KvA9pU8dViRTZqNXIPK38Y
         WOyUcEkNFB5VrevYqEBiaKw26FHu+fK0eRjEId4fY0IX3qUPpKQpJGAUYh5gjDE07wOq
         RU7vwACNX7vyPMAvs+B43s/MBAoW8Nt7gePe+KiWgwHkngnr15Hgp5Ugnxjth3xyudzi
         1Tbs5TNdZSBY2PWmdpYlJMrKg6gRw05twaocVHSHnxCadwx19+H1KmEL9bX0I64fh0ak
         +JLDcs4w+KUp3D3yfuz/TZSKSgpHAJREzK48QEXI/vn2FvuIVwNUx+dXATeB1wXBCeUI
         d7aw==
X-Forwarded-Encrypted: i=1; AJvYcCX2tecLNPerGnlXEal05rt9sF/m3XYFp2+lw5iImyqObfgfUG1QqX4ryg1/NRl0//opkznmk2gC+tN0jA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMEMqv4M7O2wIUE2UMy1qlRtXHWVBBW/MeOGEbcWjftUgR3TOO
	1mTjvvIGQBUdAUhLls4DEv7qRN85pxoh1+Y/VW28HRZG0raKqUKV
X-Gm-Gg: ASbGncsXD0bfl2xVRcB4WcWU5ziCowGm1nGysMiOUPZ2z4UQV9FrAK+1IeXMwW5CHvS
	QboWfKl2h6Ps4dV2cji0KeMfykHF694/OkQrvZYliJnVCitFo3ZSwU9RVE1RjFv84lpbnX5G6gG
	r8JTRhS8vUlDw2EzWI6bfQy574QKW3cttWgL5kCxMJKLhn/kCC3KTRX1chUigI4lFsbkjxdUuEt
	xOIQAtS0GVS75pqZhMJVAVqYwzSoi5JAohXdeG2gBKSTJ1iw4AAVG1HZ+MQXwMUDzIU0ALZ6PUy
	bkBoKbuMoIHs5/XTgkknzQEGvZMCqwaOca4C9w89sAsExXdvqPzu4ZVGRvNt88MylQidbZt0eU/
	EewoaYvNqI5UDOMfriIl8QI1z7diKvQ==
X-Google-Smtp-Source: AGHT+IGNAbuqm5FmxluF5wtjWawmF2WQ5tcvDHorTjnjuiAauWPbvFZ5uA5beNY4uy00YPPjFwGD/g==
X-Received: by 2002:a05:600c:a04:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-43ee06401a7mr54753425e9.14.1744007178599;
        Sun, 06 Apr 2025 23:26:18 -0700 (PDT)
Received: from ?IPV6:2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6? ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a9da1sm10916991f8f.22.2025.04.06.23.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 23:26:18 -0700 (PDT)
Message-ID: <115a9838-faf0-4607-87f9-c952b43bca78@gmail.com>
Date: Mon, 7 Apr 2025 09:26:17 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] crypto: sun8i-ce-hash - drop
 CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG ifdefs
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net,
 linux-crypto@vger.kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
 <20250401192321.3370188-4-ovidiu.panait.oss@gmail.com>
 <Z_NM9LnUF6Gpv_iz@gondor.apana.org.au>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <Z_NM9LnUF6Gpv_iz@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 4/7/25 6:56 AM, Herbert Xu wrote:
> On Tue, Apr 01, 2025 at 10:23:19PM +0300, Ovidiu Panait wrote:
>> 'struct sun8i_ce_alg_template' is always defined, even with
>> CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG disabled, so the ifdef guards
>> are not needed.
>>
>> Make sure the statistics have IS_ENABLED() checks instead.
>>
>> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
>> ---
>>   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
>> index b0959d8218cb..530c5181d73c 100644
>> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
>> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
>> @@ -31,9 +31,7 @@ static void sun8i_ce_hash_stat_fb_inc(struct crypto_ahash *tfm)
>>   
>>   		algt = container_of(alg, struct sun8i_ce_alg_template,
>>   				    alg.hash.base);
>> -#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
>>   		algt->stat_fb++;
>> -#endif
> 
> Should this go under IS_ENABLED as well?
> 

This is already part of an IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG) 
block, so no need to add an extra IS_ENABLED() check here. Just the 
ifdef was dropped:

	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
		struct sun8i_ce_alg_template *algt __maybe_unused;
		struct ahash_alg *alg = crypto_ahash_alg(tfm);

		algt = container_of(alg, struct sun8i_ce_alg_template,
				    alg.hash.base);
#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
		algt->stat_fb++;
#endif
	}

Thanks,

> Thanks,

