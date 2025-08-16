Received: from mail.rudi-horn.de (rudi-horn.de [198.7.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F28218AD4
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 12:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.7.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755347153; cv=none; b=OLoQvwNcXHzlyQawpaejRT7oTXuno2tC8Kl0g5RI35EKAPPM/HGmjJ6u9sz8Rh7Am2PN9lgNggGCESINQnsy7tZLDRzSEggG0oPGRyvTd7iQ8NASGbgFjg3INDC4fZR6MXfPC+c4YfNERqGYeIaA+OoQLiqEM6vwddZ3o5rezNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755347153; c=relaxed/simple;
	bh=U5yvv51h7jNBk4fl4yxTI/9u4SE7TtfmbTGF0mfwtrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IMTynpfCmLbgbtyxOzibC5/Z8nzew4944mzpIstefXkX7kdPkM2n11d+vxdPLyTc/yarT2P/vwJZ5Iwb/hXWZsHFnssPdtaJ/Qim1ApqKSDHQn/4e+BfMhdRufCwrac1eVMSPzfcPeA+f78jz79mr6M7r8er9soExlj+hn1Da1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rudi-horn.de; spf=pass smtp.mailfrom=rudi-horn.de; dkim=pass (4096-bit key) header.d=rudi-horn.de header.i=@rudi-horn.de header.b=vVypFwMP; arc=none smtp.client-ip=198.7.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rudi-horn.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rudi-horn.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=rudi-horn.de header.i=@rudi-horn.de header.b="vVypFwMP"
Received: from [192.168.178.22] (dhcp-82-220-85-57.bbcs.solnet.ch [82.220.85.57])
	(Authenticated sender: journal)
	by mail.rudi-horn.de (Postfix) with ESMTPSA id 9A5991A0A41;
	Sat, 16 Aug 2025 14:18:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rudi-horn.de;
	s=mail-vserver01-rudi-horn; t=1755346727;
	bh=U5yvv51h7jNBk4fl4yxTI/9u4SE7TtfmbTGF0mfwtrc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vVypFwMPIi56HQx8mnBON3zTjE/BkqP4f9X778f8c+B7YMyuDd0XM28Iw9VChR86D
	 ip0GmW0fuE57OhaMFWgfXxPqoFVuPhLHThrnGH1Ds28K6+dGb4KWEHBgdxFjUkqIWl
	 qCNAVIcn6HSC56DDJDGDGKKg6WKMEMRv06H1d+H9gqX3vZqPbSrKkrwakuLl++5Nxn
	 qrAaXtuoJejmKODYTow1zYEMoJ4jfz7+B57lVGeImMjkackxhrOHy/D09WtolVT9mW
	 TcvaJTV66Xl18Ewl+54PtEGaHrLYCHYceLH68RhR4dWIUz2NdVyMtevzs8MQkUMBir
	 aPJDBfz/P3MCQGcjs9eXqohx5idMZoImsRmn6Mq8DoEJF0lvokAElxQQBZooV8u5is
	 xYxDUjxXfRw3ff9P7YHY/Q5jUuv5yZmGvO+LbB1hPevl34hQnEatjlk3VFMepzlBRQ
	 geEC/AcdMEPmPP4zVqwNrNYwgmqwgrTg6V4I8HxRHcfv2giYvg5kwJ/Ay8H/bGmobq
	 3hbgfPkQMFJa9IpSnOke83bAH+3vm5YXlPn7z1VUlYfTCwh8BYJcS9leOuPHyX0Kag
	 4gwAKiWwB+/m60kJCH1LFu0IFMTZPNMbdZVS/RfAue6xuILYV5vFQ+O+XrWuP5nWCD
	 mVdUbstik7wS3E2pF1ltdz0c=
Message-ID: <9c947490-a571-4b35-b3a9-66c8174a7490@rudi-horn.de>
Date: Sat, 16 Aug 2025 14:18:44 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH] Fix detection of odd memory configurations on sunxi
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 linux-sunxi <linux-sunxi@lists.linux.dev>
References: <56f44755-fca8-4364-905e-685e79fd1aea@rudi-horn.de>
 <1927944.tdWV9SEqCh@jernej-laptop>
From: Rudi Horn <dyn-git@rudi-horn.de>
In-Reply-To: <1927944.tdWV9SEqCh@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jernej,

thanks for the comments on the patch.

 > I don't see a benefit for public function here, since it's unlikely 
to be > used anywhere else. Just mark it static. Compiler can optimize 
it better.

My motivation for this was that the implementation relies on subtracting
`sizeof(u32)` from the address. This is an implementation detail that relies
on the internals of `mctl_mem_matches_base`, and so I wanted to place
it in the same file as `mctl_mem_matches_base`, preventing it from being
static. It will only be called twice, so I don't think optimization is 
too much
of an issue. However I don't feel strongly on this if you would still prefer
it in the same file.

Once this is resolved, I will submit another patch with all of the other
comments addressed.

Thanks,
Rudi

