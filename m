Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B3C2E3708
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Jul 2025 20:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752005344; cv=none; b=ADTF3756Q9vvBnt/uNFnrqUHaRWcK6NzARunIK8O9/HNXOEi6+CXzP8NVWptIb+qx6kbPI3CCVpVNOrpmw7Gd5Fh94+udvpHJdRT6rvd1pjIuk1ssoT4aoYHIvVxlmhQz2RbSQUtom9fwx/XzeWYP0sYs8s/UxGqeLidI7JkJ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752005344; c=relaxed/simple;
	bh=wGIW3vTTNsPMFwa66S33gP0jJPz9vag5fqV6TgNMRkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X10Uxk95PPO0FbDWlVQ5HX3NBUWwM2TkrQQ2rMuI1hFq/EvbxDRuBOFKj6aWJglBnss07wHYT/7SXB01DqP2WcL5gKjNV9DjoSWXczNGKsk6y1CDRcQjPCn5uLZcgjDYTqsLjFMfmxv5lERyO3bzRKOdRhfO6JI8DKKdYkuilVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMhwfK1+; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMhwfK1+"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso9298430a12.1
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 13:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752005341; x=1752610141; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SJoKGMixdxbuoBQZf38SMFzcAORtomA8uvkcfR18me0=;
        b=DMhwfK1+qgnDf/T4Qnct6R5P+Sco2oJ4Iy7Nx5/hF4PMj3B6a1wDvoZAuhciocC8/k
         XGoiijltlsCUMtpnAVjSxrs/T0u8tLb+u7GQDBG9NyKK8EYuAGaxxgczMW8UwF3plpxS
         m3c+ggl5XvxtVsKCuXpSFEevNBewSCtrn7Lh/iiWDBVb7d+6slaynNpefjcvhB8MyTSG
         vowzMtxI3yE9pqWrK2M5nkRJ80AL6jDQ6dt448dgG9jAAGb3nj/6RUOiKWV6NipRSqnc
         7do3SyYxv7VeyHUegSKu3tNfvx+PEZ+9OcclfhVEynv/CmMDkZXrdhGFah++v/qq2gWD
         Mdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752005341; x=1752610141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJoKGMixdxbuoBQZf38SMFzcAORtomA8uvkcfR18me0=;
        b=bNxlAY+y40twb2s0Se4RNsJzgvmtRh1E/X+ppj7nPHIIdYJdIpXCMAmRXMJawlF57P
         PIJY5IbZP3/gE/FBHH9OvzwZW/JleX1ZALIAhRUk0amGr1pvY8YIm/YRJd30g/lVe8mJ
         kcAd4GjMo5CfeTGvqeWuyw6WE7bnEbQlyrmv8qJYrOELcQg9MZ4hVHq9fzrfhrMYriEM
         I4R5HS6BnoxILnYbrj0mo1aQh2IEH+9C1ETz3kTZJbJzrri2tvQ74p77XM7mZJiMTTgi
         E1H07HfJMRkugq3Ikar3QN45OLhfISgtPFN9v9xOsvbNpFrUEfKwlNHF+xX1p73ObR99
         cfNw==
X-Forwarded-Encrypted: i=1; AJvYcCXPqmhklUAiAPaXEY3Yf10kIbt++cTY1kAjhXJh05zEEQB4Y7fXXGPxbeBGuKJrt2YjyRW5nZvJrHKKew==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCNeAEmZhKE2ZbqDQPaxVHXbaAfme3Tk0WcXaGHthCzF7AIA9G
	IVNRq9omoIWjcxaejvF+Ee3dniSKLGXjGmtSDmoWs14q7SKsFuuDnQU8MiqbVw==
X-Gm-Gg: ASbGncu0kuLTQMu1QoQqRrSy1l+pqMPu3z1eYMRX/FdLNZCPdCU1OloID2nREN5wXld
	hgqO1coQ/dZwm8yk80XWKOynQo3Jiuo5bMZDTcpmY81oc5x0X7NOldFQYCuyyW0+L1dtIv4D5Ck
	bG3f94LHAZHsuMEkVg5fomW4owGeMAqmkpDdS22kK7kbrs2+RfCGVgvEpLzWUAL7HB1JIGNjQ9Z
	O2TGqx65bUcoDCuc/PRqYCrHmM+v8t6G77uzdqla+hl4LmXcKTv63UAAaZYhk24DyY//2QBbixD
	32MEo83cRvjj2piOHRdVQYYnDBKpTXFIZcLotVzETSv/hcOtggcIGGRFatLk0PyoIoaMvoyaLOC
	FME6M1snUhEWgWL09reCZFUqsMq5AizYX0AUjiaHM5AJ1OJNOLdWbjaaaeg==
X-Google-Smtp-Source: AGHT+IFMUIFhAFLtzXXbjGIvBhyVU4xR5NCQSkIi81NSZsJ4W1pu9KoFPlGV7XT3Rq6mPNLnbiIOLA==
X-Received: by 2002:a17:907:7e9c:b0:ae0:a483:39bc with SMTP id a640c23a62f3a-ae6c6cdfdabmr52787066b.46.1752005340445;
        Tue, 08 Jul 2025 13:09:00 -0700 (PDT)
Received: from ?IPV6:2a02:2f07:6009:b200:8bc2:7901:5231:7913? ([2a02:2f07:6009:b200:8bc2:7901:5231:7913])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66e7f68sm961243066b.13.2025.07.08.13.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 13:09:00 -0700 (PDT)
Message-ID: <95f4ded3-f649-4bdc-a3ca-cade77aa2e92@gmail.com>
Date: Tue, 8 Jul 2025 23:08:58 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] crypto: sun8i-ce - move bounce_iv and backup_iv
 to request context
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
 linux-crypto@vger.kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
 <20250626095813.83963-4-ovidiu.panait.oss@gmail.com> <aG1lN94feb4OJVsI@Red>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <aG1lN94feb4OJVsI@Red>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/8/25 9:36 PM, Corentin Labbe wrote:
> Le Thu, Jun 26, 2025 at 12:58:06PM +0300, Ovidiu Panait a écrit :
>> Currently, the iv buffers are allocated once per flow during driver probe.
>> Having a single iv buffer for all requests works with the current setup
>> where requests are processed one by one, but it wouldn't work if multiple
>> requests are chained together and processed in one go.
>>
>> In preparation for introducing request batching, allocate iv buffers per
>> request, rather than per flow.
>>
>> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
>> ---
>>  .../allwinner/sun8i-ce/sun8i-ce-cipher.c       | 18 +++++++++---------
>>  .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c  | 12 ------------
>>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h   |  8 ++++----
>>  3 files changed, 13 insertions(+), 25 deletions(-)
>>

[...]

>> @@ -273,6 +271,8 @@ struct sun8i_cipher_req_ctx {
>>  	int nr_sgd;
>>  	dma_addr_t addr_iv;
>>  	dma_addr_t addr_key;
>> +	u8 bounce_iv[AES_BLOCK_SIZE] ____cacheline_aligned;
>> +	u8 backup_iv[AES_BLOCK_SIZE] ____cacheline_aligned;
>>  	struct skcipher_request fallback_req;   // keep at the end
> 
> Hello
> 
> Are you sure you could do DMA on sun8i_cipher_req_ctx ?
> 

Yes, that is my understanding. Request ctx memory is allocated in
skcipher_request_alloc() by calling kmalloc(), which returns memory that
should be suitable for DMA.

Also, there are multiple drivers doing this already. You can grep for
____cacheline_aligned inside drivers/crypto to see other examples.

Ovidiu

> Regards

