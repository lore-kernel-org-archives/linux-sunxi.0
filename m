Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BD619A2A3
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 22:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728599295; cv=none; b=kbwxOX0CQGp7G5nFQ6A1RxEyfWhzGn7zy5yTm7XYkXikat5fjkRfnKodIuJ0X/DtzTYq0WlnhwGN/yPp6FkRxutgaduNZa/EZlVs1+J65t2jBavXA4WuHgLoiig2+6kWLVrbT4iHTbFnO9GBWxozJwUNxAkA9xzW/K5VIXLLqXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728599295; c=relaxed/simple;
	bh=qcZVCuV4h/CWEWtF7cVhrUnJAhyRLz0eLmY4sJ0Iiug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B5Hc2+9c+WrH7OxjlXJ6RWkHUux+Hyl0c0NWfPRh0TzDOm+/9qr4E2d7F5nGUO/2VVSpnf2vQhPYUpsbKR/zg4skZjguDWSwfSTRUEnrNj8TcvM7EiaGC31UPjGW9aYpxx8yNat4j0i4cDGjygFqrl6ZxlLIif6kAy6RKCKdyAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8NN2MjR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8NN2MjR"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so702467f8f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 15:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728599292; x=1729204092; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YEd3qglOswLcYcbhFNnKRIA0aABkVGP6KYCeIpbQEAc=;
        b=m8NN2MjRs89xBAVyLWx3qfGoY955wSBIqJ1F/WxmiPnKJ0TXR3tZP/+DmjlOoL33u9
         Iro/fsNeYGYsFWrzjUrsdY9hnMgJGYyv7b1W/sSwtAi30PyMaiVPKX/IsI/Zdp9tijfn
         wYeGIu4rWTkMcZkKaUoQXqfcIcm5UmyJ0Mb2BAcZgScwZFvfYu/HuFBtDwedV0XCf/mK
         3b4Es8Gz10sR8D76PBwA2Py3qPBatLRSB8N8ZwoU6yobzjGQa8dTnS1Ibc5KnEFRTBBF
         KW9ZJD/yrpm5eVETb8HJN/IHW8MgXKhNCXmWGjTjfW+rpqjLmjNiM/5suYygiA2gIdZR
         tHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728599292; x=1729204092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEd3qglOswLcYcbhFNnKRIA0aABkVGP6KYCeIpbQEAc=;
        b=Iww9ZQ4p5XLuL3LekmuTXB82/By+3Y3qR+F/eEq88HCk+xfs1cisSiLv8j32PLD5T0
         jRRbC2TCYTPPLXEaBFwtFH3rCi/izjh/3xr+K0dMO128oZgHNmFHgwacGp5rgBb938JZ
         PqyLrtnaXsef+ttSr2XYBW0sMCg+YSQggUuteS3vFlgy0Q3GwN/C4yG6mtrq0iyBK38y
         oaMn6oXUkEhV62HKJa6BuXl/sSM1mzFmYTbHNDE51NbePOKMe16fcjsobm94G84L+G8G
         jwJ4Gfv3w7tA99KGVSuFVse4cGYKLt6nNbOnjRK9aKuIGnRZdroEgQDNt1tJnHhoAFoE
         3Xpg==
X-Forwarded-Encrypted: i=1; AJvYcCVZBtTpnbtDXVJ4bMFbsGbwGD79cPQGdxBLk6pGXDMQ4uHJtKAPiqAysj3kN47YLhiiKwNqXDBLJZY/TQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxID3j0FTcUqckkhLuvpl6GMhlcSmTkerL7Vkz1WNTxbrzdej4Y
	YaSuqwDfawUdilf3Di2ogCW4IEXOdLHEzEwApywYxTv8XrYbPrxV
X-Google-Smtp-Source: AGHT+IEyhCb2gEHddkiaFk7no88fWWHUHs3t/T3X7uZbjBAibc4VOLvPsp4gP7X9WOW0E9zcoNOljQ==
X-Received: by 2002:adf:a31d:0:b0:37d:45f0:dd0a with SMTP id ffacd0b85a97d-37d551ab52fmr366574f8f.1.1728599292378;
        Thu, 10 Oct 2024 15:28:12 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:3d08:841a:562:b7b5? (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6ce001sm2472885f8f.47.2024.10.10.15.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 15:28:11 -0700 (PDT)
Message-ID: <56d74806-93f4-4e31-9b21-925b8deb5d3a@gmail.com>
Date: Fri, 11 Oct 2024 00:28:08 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] Input: sparcspkr - use cleanup facility for
 device_node
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-6-ebc62138fbf8@gmail.com>
 <20241010214348.GD4017910@ZenIV>
 <22e55eb1-8aa6-43fa-8020-d18f9f6aa6f8@gmail.com>
 <9a85e6bb-884f-4fa0-b198-bf7707af76c8@gmail.com>
 <20241010222240.GE4017910@ZenIV>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20241010222240.GE4017910@ZenIV>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/2024 00:22, Al Viro wrote:
> On Fri, Oct 11, 2024 at 12:09:01AM +0200, Javier Carrasco wrote:
> 
>> I think that the issue you are talking about is that the goto will
>> trigger the cleanup function of the device_node, which will not be
>> initialized at that point.
> 
> ... and gcc will compile that without an error.  Clang will not, but
> you need to watch out for build coverage in arch-specific code -
> clang doesn't cover every architecture (and won't cover some of them,
> no matter what - alpha, for example).
> 
> As for the scope changes... note that you've delayed the moment of
> of_node_put() in some of those.  It's harmless for device_node, but
> try something of that sort with e.g.
> 
> 	mutex_lock(&lock);
> 	something();
> 	mutex_unlock(&lock);
> 	foo();
> 	return 0;
> 
> where foo() itself grabs the same lock and it's not harmless at all -
> 
> 	guard(mutex)(&lock);
> 	something();
> 	foo();
> 	return 0;
> 
> is equivalent to moving mutex_unlock() to the end of scope, i.e. past
> the call of foo(), resulting in
> 
> 	mutex_lock(&lock);
> 	something();
> 	foo();			// deadlock
> 	mutex_unlock(&lock);
> 	return 0;
> 
> __cleanup *is* a useful tool, when used carefully, but you really
> have to watch out for crap of that sort.

For cases like the one you are mentioning, scoped_guard() is the real
one to be used, but I get your point.

I just overlooked the goto as it just goes to a return, and I processed
in my mind as a direct return, which is not! I have even reviewed such
issues in the past... karma.

The goto in that case is meaningless anyway, and a direct return would
be more readable anyway.

Thanks again.
