Received: from msa.smtpout.orange.fr (out-66.smtpout.orange.fr [193.252.22.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F2C16C86C
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Sep 2024 13:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725802914; cv=none; b=LUIatuBG8CsYVPwd9+e2kOSDsKw4EOhdERL9ezVUT/zo6aMyVR5/41uUgj4wEIFL8D0gh5SQQjmSC8srlP1UkzN82/vZ6Nt0bWR+qoD0ykDUKa4lAKzKkfz2nyhyf84s2rhHH3xSvDDtfIZznNxmU7mN2J6IUyMBjo+ecOo2sks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725802914; c=relaxed/simple;
	bh=X54QgKZkowUFWekxz5jn1MXRDbhBtNSUV2+YPjIO3lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wl3NeermX0zDqSmSR9A6b5fzl5SbJH2PNsIrXS4eWRie0AGlR0vh72eFvMfcoafQtFnFNu0FwcUify9oqfxaL8TpcaOqigf5Elu7BURPeH8BOUK4TOT7iF69bXlDErzyRTTaPcpOGOfGJKF5Va0KLgDt+8r/noaZ3ZrPuO62wX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=NJ0YRBV6; arc=none smtp.client-ip=193.252.22.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="NJ0YRBV6"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id nGLKsM1d52iYJnGLKsH1eE; Sun, 08 Sep 2024 13:44:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725795878;
	bh=O7lWOpC+TJoMHHozDCqt61jx1ZWnzh85Y8vzc+JCg+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=NJ0YRBV61CW3WPmbnIZrQPCymP9w08VhacUQSWX8uzP6PWbTlD3E+pOny5Xqrte9M
	 df6KYzPaT0u9Npft0iFlsyLDzYetPebXkqCFpkNy5x6uLqcHnsxwup0nZv9/WPELu5
	 ElUFy7wZWHD2ajTVCQ4acY8o4idmOYECbfAzAULJhwa7cUEc4TioWs+j76WAdc9h81
	 itckHpGXtwVAqbsgCx5dria+JjWUabOsuJ7gFrTAMGqBYbwAw5AA3juTgg5ZzjP9ZN
	 6uaWTygyGOrqtxmKR1YqT0rbVY+Z9tIdp4IAKVhM2F4t9vlWCy6NlxrDIh8PmnUmhu
	 FtqpnHNgaTq4A==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 08 Sep 2024 13:44:38 +0200
X-ME-IP: 90.11.132.44
Message-ID: <eb89a77d-c733-4efd-be19-b95039ae10ee@wanadoo.fr>
Date: Sun, 8 Sep 2024 13:44:33 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iio: adc: Constify struct iio_map
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <5729dc3cc3892ecf0d8ea28c5f7307b34e27493e.1725729801.git.christophe.jaillet@wanadoo.fr>
 <20240908114546.395661ef@jic23-huawei>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240908114546.395661ef@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 08/09/2024 à 12:45, Jonathan Cameron a écrit :
> On Sat,  7 Sep 2024 19:24:46 +0200
> Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org> wrote:
> 
>> 'struct iio_map' are not modified in these drivers.
>>
>> Constifying this structure moves some data to a read-only section, so
>> increase overall security.
>>
>> In order to do it, the prototype of iio_map_array_register() and
>> devm_iio_map_array_register(), and a few structures that hold a
>> "struct iio_map *" need to be adjusted.
>>
>> On a x86_64, with allmodconfig, as an example:
>> Before:
>> ======
>>     text	   data	    bss	    dec	    hex	filename
>>    21086	    760	      0	  21846	   5556	drivers/iio/adc/axp20x_adc.o
>>
>> After:
>> =====
>>     text	   data	    bss	    dec	    hex	filename
>>    21470	    360	      0	  21830	   5546	drivers/iio/adc/axp20x_adc.o
>>    33842	   1697	    384	  35923	   8c53	drivers/iio/addac/ad74413r.o
> Cropping was a bit random, given before and after have different files.

Argh, the 2nd line related to ad74413r.o should be removed. Only the 1st 
one is relevant.

Sorry about that.

> 
> Anyhow, doesn't matter much, so applied as is.
> Note this is 6.13 material now.
> 
> Thanks,

Thanks,

CJ

> 
> Jonathan

