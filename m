Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D2B33E7
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588860; cv=none; b=CLZSheuNFJc6CtWOWEWfPepn6AaxbOIz32o0G9+0aiIRAG3YgXURZk4mT/DgXMCS306a+ByrcMij6y4gg56Uqf8W+X/LffcPHljZy6zWTbGezFeCVm1wah9LqcuJU2NyExRe8a8iZGq+EYgT6c1rvg8gAWTwswrotlugXeO3/8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588860; c=relaxed/simple;
	bh=A0BqI1OhWECGRoHXOwEM5A1fqp0J7utKdtX59nddDMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IrmaXLaHhqFfTQZeLDBQLow6LO8WRnmRs1F+fNv0jYFImf70SnkjrP1f19RnByFxyszRAspSfOj8lxyaICQPfpk89DkgDJm4yG2wmnGfh0ksR3wZG4uWJkxHGAxdUHci9SptahQlRLfz3wr70Xjvwb5LQvOdjovPCA6n8t/giCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SthSuPTm; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SthSuPTm"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acae7e7587dso352706766b.2
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 06:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745588857; x=1746193657; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7b2k/0/MRDFBkYnkScGuwVZ9DXdXvkWRFpO84oyIems=;
        b=SthSuPTmiNdG8+MrCULNUUG3axAILVqqlOLjC9G2R6rquSyrTSmhAe6BJZYV/M2g0+
         8SyLwtgokvHtKEfGiSYzqUOE61LTG5S+E21VmTr8i7OmEekeh1hlRfp/SNPgzB4MJKbb
         xy4EITGMnLk+akIBSB7MZVboP/XC/0TOSr+HRVxlytQU7CZ/rc5X+VDjSD1BLIrvX7lj
         g8W88BQkAwuAcDtSj2EQeekJfcuC8SEBKpy0ffx0ZDDahlTpBkI8BOnp+UkHM3LeMziu
         XZQpMtj+zmTZCi+SQ34Ghkz16nkq74pNkD7T/YPKYoIWLNh42bLWBX31BXr4dX0lbN2z
         faEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745588857; x=1746193657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7b2k/0/MRDFBkYnkScGuwVZ9DXdXvkWRFpO84oyIems=;
        b=hTNRZr4RA1EdJLYKhEoMUepGMkUu3bcWJEUyCiubnTev46MSHWso0Tz12AXTib8dff
         lWpyVyxgqffWUK62zVAvE2J/AxJV83njc6/E3gHCuJWEQubXbPO3jT8P2j3exyclL2OG
         Sz4lyOXVyO/1fNJAefHhpz/O9+biRWhXmZbGRt1F6ZQXk5rp3QlNRQYmjBcmq2+osEFc
         L3e8u7zMNzkkq82ui+gdzAkXjrwKdqnwsSi43fnOuMKFja9Ddbr3BkpFHFTQv5NvmhvZ
         dmz/ria0AGEfSNt0zBLCb4xXJYtWzrG4w0mHkfSQvNT3KVIbVimbvDrXu2M3QvpYBM8B
         n99A==
X-Forwarded-Encrypted: i=1; AJvYcCW3Rvbj9z45sAKX4uYW+tLv6Czauuh1tim1ghHXYErOFuyxXEE6OfdeAoe6ibe3KYU69HYXOCkLdPK8pw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbnLG6ja7iEtHOydFmngLLp8wCCHs6Vhyb2BtPwi2nFSXnOWTh
	mgJUy8oUy5oXm661OWZTaj95U57fwdJfzmBQZgI3XMGEjiLcBWiI
X-Gm-Gg: ASbGncs2xuFM3rPt0wl0tJHvU9lL1W4yXDPJhKch/szHqiNVXbVkVO54ZwNyvuBhcXk
	+2q2Lg0VUaWFVN601r7KArhAKYLDnEUjMeDXVETt7nDg5wNz7SNihEJM2m5M4C0TSaF0GoxtI4X
	qbXuTg3l56iNiCp1CKW97A0hfu3QBwQi0z67tM88k1j/+ad09bnXY9tiewVYtCAGngz/b3ww4zm
	Pxt/59oWhsoqfKFWwYkmVEJw9f3CflJqYfHe5cOlNocV/wfY8dXfl6LebzZi5N/JYJ1EoyNjz/3
	3l6I+bPkXf7tBGm2F3zEOKzoE+P8UDmdBkb2DN2SWh93IFK38/AKNR53iZhJiFfmmeTbctdgcw9
	gpHRew/9yXKpAWUEIcCdlkimWD3ETOQ38q7AB
X-Google-Smtp-Source: AGHT+IE3+U9lKdyIw2HglYpHlU5Ju6Jvd02RlixVwiVpib47lTMUqn1jZXSuE/LNf8JT5D2FHFI2jQ==
X-Received: by 2002:a17:907:3f0b:b0:ac3:3e40:e182 with SMTP id a640c23a62f3a-ace7109ff27mr235634766b.19.1745588856499;
        Fri, 25 Apr 2025 06:47:36 -0700 (PDT)
Received: from ?IPV6:2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6? ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41cb2asm143227566b.10.2025.04.25.06.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 06:47:36 -0700 (PDT)
Message-ID: <7653bf7c-03ac-4f94-a80c-2bfa3004d287@gmail.com>
Date: Fri, 25 Apr 2025 16:47:35 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] crypto: sun8i-ce-cipher - use IS_ENABLED() checks for
 debugfs stats
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
 linux-crypto@vger.kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
 <20250425124517.2225963-3-ovidiu.panait.oss@gmail.com> <aAuOdDhpnLE5bM_y@Red>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <aAuOdDhpnLE5bM_y@Red>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/25/25 4:30 PM, Corentin Labbe wrote:
> Le Fri, Apr 25, 2025 at 03:45:16PM +0300, Ovidiu Panait a écrit :
>> Add IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG) checks before the
>> fallback counter updates to make sure the code is not included when
>> debugfs statistics support is not enabled.
>>
>> Also, drop the existing ifdef guards, since 'struct sun8i_ce_alg_template'
>> is always defined, even with CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG disabled.
>>
>> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
>> ---
>>  .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 46 ++++++++++++-------
>>  1 file changed, 30 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
>> index f03a8fa7bfa2..433cd18f0b5b 100644
>> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
>> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
>> @@ -34,22 +34,30 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
>>  
...
>> @@ -101,9 +117,7 @@ static int sun8i_ce_cipher_fallback(struct skcipher_request *areq)
>>  		algt = container_of(alg, struct sun8i_ce_alg_template,
>>  				    alg.skcipher.base);
>>  
>> -#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
>>  		algt->stat_fb++;
>> -#endif
> 
> Hello
> 
> You put IS_ENABLED everywhere, but here you remove it, why ?
> I think you forgot it.
> 

This is already part of an IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)
block, so no need to add an extra IS_ENABLED() check here. Just the
ifdef was dropped, as it was not really necessary.

Original code:

	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
		struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
		struct sun8i_ce_alg_template *algt __maybe_unused;

		algt = container_of(alg, struct sun8i_ce_alg_template,
				    alg.skcipher.base);

#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
		algt->stat_fb++;
#endif
	}

Thanks,
Ovidiu


> Thanks
> Regards
> 

