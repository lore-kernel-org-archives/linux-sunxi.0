Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D8718BC3D
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jan 2025 18:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842270; cv=none; b=XjgFvOrn/+0AkJb+M3+QVlk9nU9PiKd0ECiQLus3z9XSfJS8mone3GSco5zioIr9ODQz9zRGeUl1iDTb/qc/wSeozLBUyE/E9QxE+6pOjCez9Uj8KDTxP95jJzrdrNMmVbbUHSBSAJuXG3P7ncuBRwG4rkmre6N/IWXVoaQibgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842270; c=relaxed/simple;
	bh=2JmbDnbQNc7V2pvknT5P22OhOlGaZCLcLwRdeBBrIqI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=JODkypZh07Gh2VuSbvSf5ub8gG5Bgp/0N9jTlPO6UODG1HEjowsu0Fk3wX5zT3WIHW3FCF2lwtXBgH33dU693APHteuGDgcj84Kxeg4Me9nst0RBSUGyutYPtRFFywRoP5ev/dD9W9753UJD42ARPNLjecjEMecaTjjKYb2+B/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=hhA1uIPX; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="hhA1uIPX"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References;
	bh=8yQkjhBK4YJwWIryxdOEdCXtJYbtQ2mot2TfEcMj8YQ=;
	b=hhA1uIPXzF1lKgkds3z+fKDgB3qABdkcGbYjmAMEGVn4ONnuTKjaNHjUCFGkApCg1/nqnVgSSg2l4OLzak0oyMSlyVug709QBJB+2mVqrGDz5w+4DRV0xwEQQIne4dRZY672Wi1bNjAohSEVFtKmrl39glYC18ifkQoY5VXJs1o=
Received: from webmail.netcube.li (WIN-IJ7TS3MJ5LT [127.0.0.1])
	by mail.netcube.li with ESMTPA
	; Thu, 2 Jan 2025 19:24:05 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 02 Jan 2025 19:24:04 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add NetCube Systems
 Austria name
In-Reply-To: <478a6364-0537-453a-881f-c460de2f67a8@kernel.org>
References: <32b5c286-9457-4b93-a93f-c8aff356ec10@kernel.org>
 <20250102175006.3675-1-lukas.schmid@netcube.li>
 <20250102175006.3675-2-lukas.schmid@netcube.li>
 <478a6364-0537-453a-881f-c460de2f67a8@kernel.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <c025818214942560a291f8c53108503a@netcube.li>
X-Sender: lukas.schmid@netcube.li
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Am 2025-01-02 18:57, schrieb Krzysztof Kozlowski:
> On 02/01/2025 18:49, Lukas Schmid wrote:
>> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
>> ---
>>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> 
> You did not read really the messages we gave you...
> 
> 1. Read what I wrote in my first reply for v1. I gave detailed
> instruction to avoid the exact mistake you now did.
> 
> 2. Read again Andre's reply.
> 
> 3. Do not attach (thread) your patchsets to some other threads
> (unrelated or older versions). This buries them deep in the mailbox and
> might interfere with applying entire sets.
> 
> 4. Next version, with proper cover letter, is after 24h, so you have
> some time to digest the feedback.
> 
> Best regards,
> Krzysztof

Hi,

Thank you for your feedback, and I sincerely apologize for the mistakes 
in my submission process.

I did read Andre's reply and your feedback on v1, but unfortunately, I 
had already sent the v2 series as a reply before fully understanding all 
the recommendations. I realize now that this was a misstep and caused 
confusion.

I will wait until tomorrow, around 20:00, to send the v3 series. I will 
make sure to include a proper cover letter and ensure that all the 
feedback from v1 and v2 is addressed.

Regarding the v1 feedback, I thought I had incorporated all your 
suggestions. However, after rereading it, I seem to have missed 
something critical. Could you please point out what I might have 
overlooked? I want to make sure I fully understand and correct it in the 
next iteration.

Thank you for your patience and for helping me improve my submission 
process.

Best regards,
Lukas Schmid


