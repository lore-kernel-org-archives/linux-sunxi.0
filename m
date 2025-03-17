Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1273D21C17D
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Mar 2025 08:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742199737; cv=none; b=R2WJa8Gu2ICIGDBd6eX9O9wsLXmtw9OEUF9OH4l5orbr6ZgS0YO0HOqVaBzySprhrxem0NUtGNFgPnxgmhK1lghYIMlYbbQjW6LS9VrgN38ZpzcQIyum//0Z4KfF8BmnOvALeqGICxxbfiuH2AXRKKTKIz0PEHSZZRjknAgNTHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742199737; c=relaxed/simple;
	bh=5YRSK7/kMdbdHj+6rcKNANI5ccwGPToBCiTHQMNwgiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sNBcCMMoSClYYMnZQv2w2H0O2bFcKb14kbtocmK2aqOD3shGZabevR8aGhZ7kpv+J6MJrVvEnGlFKQLnA/n/zHSDQtZV5ztlhOBD2l9qg6Nqe/YtnegA2oWfTE96kj2T2B+f3PJt++mMubH8NwSf+BuV4F4Dnsy0dZNizjnWYWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciP2ytlQ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciP2ytlQ"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bf8632052so44381941fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Mar 2025 01:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742199734; x=1742804534; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/8FRI6cy9CCt8b2M5LhQNzurCwCuZ436s4fIsfr2+0s=;
        b=ciP2ytlQg1JC4V4papSb5EbhwGpBu0zi7HqmAa+8OKCGBWxu4JV93DZkpcXcKGuiSW
         cBkNb1xdQ+DnlZ9PmyF7/aRkO24M1cM0BNNcAOeguOYDScVfoa1a2goKbIfW9fi58BRh
         v1GcbhE2TAAM3uajIwGoloSBqROCXU66UeTS1ORCbQkYP+kRSMYUV6UOAoBO0rgdB/na
         6o9VjsUnpke1rO5aF+Y0aXrk0ryRI36vCzygKPwLATzigI4KDeQhfOleLm9j8JkQam4n
         34PYvH74hSfZL7OAyep9hfHXupt1uPkohcyORYyWNiiNIn4YU77Pj4SRzrHDRlkjLsTm
         tIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742199734; x=1742804534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8FRI6cy9CCt8b2M5LhQNzurCwCuZ436s4fIsfr2+0s=;
        b=vM3yspVTW1TPXOBmshrCkpWSVmn7sldExRMdFBFa1kGVyuAxqrdUpBqQlj60sCXx3U
         R8HZfE5ktSZR6KcUKK3lPsJeviYa/+bwzDkKLIfysBXYoIPu42FtSlBHavB78ZJXTtfv
         d0VNTBVa7iDaMLy4FITxCut/9/zt6mqgupAnLZO3w+MpKwB8XIVN2RJkM9STbmzk3FlS
         sgJO/4EAxT9RCZL0yDykAcSP6VHMJHqom/zI+5GQk1YIe7J3n9mn8IT4oARIlO8sFpMM
         cXevCgoIUdiP91P/wWRaUCjfDSeG1UKB6cz0XjFwr3pX5+e9CzYsDx9m5TRMs+vUBs8d
         ZK4g==
X-Forwarded-Encrypted: i=1; AJvYcCXrKNkfXYkxKlV2VPOJxa2Qtkw0kPELDfvSfBwT9WwetD7DG3vGCd+Mnkon/6rJWzUGFGKzmR7xwmPZbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJhgiTDd68xsRx25o4ZqOQB13sYnnPF30GyR/FnZvOFTI+2pHE
	rkaIa+HQ+ItAKUVIZiMRQzzaYFMyZWZXG+GGivdu7AeDDi3+mElJ
X-Gm-Gg: ASbGncuhUtCAX7G4dAQWtXuCe7FyexgChxiveWDvFqNvqKUAZCBHdshqMQNL+PZbS9G
	zvLWG8aWiaEN/84S69/2cMWiq6yeYwSkz9IrQfgB0YBx5vkDVJLBaivFqn+7OEWJ4QtIQVx8Akz
	fty1x+KmMPE97lelR67MNP6xJ37x6HN80colmBlSdtU/Xk91kLw3/qdUxJMkkK1Atewa3kLjGQT
	CDNwvecWqZ1T/zH0Ou/U3CKuGcGD7m+1wchET4Q73bE/EaxZ2B44L860K7IMCpw04wdptMTOOop
	ZTBFmfpLTiQ6frKwLh3qBA9OjaGS7MQv6W8Zm+sD6WHJvKrv1BqzLqqKnFh15nIMvY2LoiZS8U6
	W3Ha3XtzOXMPiYJymmzQwwPjagg==
X-Google-Smtp-Source: AGHT+IHBKGlUlP46i1muxXD2BoUJCo9oeQCMBPNLoYtEWkTjbhR1aqc3+f20CvsiTwirEb5eGG/pEA==
X-Received: by 2002:a2e:be06:0:b0:30c:1fc4:418e with SMTP id 38308e7fff4ca-30c4a8d225bmr66527681fa.26.1742199733797;
        Mon, 17 Mar 2025 01:22:13 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1c2233sm15370161fa.69.2025.03.17.01.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 01:22:13 -0700 (PDT)
Message-ID: <66a93de8-f5a2-4ffd-9c97-c646934cc90d@gmail.com>
Date: Mon, 17 Mar 2025 10:22:11 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] iio: adc: add helpers for parsing ADC nodes
To: Jonathan Cameron <jic23@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <cover.1741849323.git.mazziesaccount@gmail.com>
 <c8899e8c535a1d93cd7588b7c160eb0fae5d26d2.1741849323.git.mazziesaccount@gmail.com>
 <20250316093752.0eacaa16@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250316093752.0eacaa16@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/03/2025 11:38, Jonathan Cameron wrote:
> On Thu, 13 Mar 2025 09:18:18 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> There are ADC ICs which may have some of the AIN pins usable for other
>> functions. These ICs may have some of the AIN pins wired so that they
>> should not be used for ADC.
>>
>> (Preferred?) way for marking pins which can be used as ADC inputs is to
>> add corresponding channels@N nodes in the device tree as described in
>> the ADC binding yaml.
>>
>> Add couple of helper functions which can be used to retrieve the channel
>> information from the device node.
> I suspect we'll need the addition of an optional trailing timestamp
> channel at somepoint. But we can add that when we need it as only
> matters for drivers doing iio_push_to_buffers_with_timestamp()

This is true. That'll enable using this for devices with buffers - which 
is not possible right now as most buffer users do timestamps. I'll leave 
adding the parameter to first buffered user though, but I think it's 
good to say out loud this is doable :) Thanks!

> Otherwise no additional comments from me.

Yours,
	-- Matti
