Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C3B3BAD9D
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Mar 2026 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773311992; cv=none; b=QajeaIGWjBsVtSG0V/Jr1GicCek9GYC4X/LEuMOTYBAuk4SsTL1Gr2Aw/iQBg5QRyuAAxyUKrrBuJG/rFi7bBZHPF3bslgrdFZJE5Ea8LA4STPCNRHyVGmjviJDvAA5nche6lgeV0ZutelsKU/JnFTwkeyElegPDH8r5nn0oqiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773311992; c=relaxed/simple;
	bh=9l60dnOY7y2Hu7tICopMPT5nq03nnWoUu7pt3LM+du8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iOWvhnk6whOGZgS/JexbNY4Lh1Ic8iY99wXe9LiPyy4MqDBKnkLlodYYXpoHL20jtXfMw04pDiA9TJTNrJax7ObE6Phbrb+oHUUo+AVy9aMYkb5GPpMlAKTtbVuAIjpLpcZ4VgsjFB6l2BIHuYiwiw9jgIWZl1iFvEUcgjb+0gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UbtyNxEb; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UbtyNxEb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3021EC415B2;
	Thu, 12 Mar 2026 10:40:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 808525FDEB;
	Thu, 12 Mar 2026 10:39:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A0ED10369D8A;
	Thu, 12 Mar 2026 11:39:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773311987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZLlL868sX2T7LiELOAOF8/VB5w2gI8YwwhfKb0vI5/E=;
	b=UbtyNxEbiaH7gAFdQXLW+F+ORZ/7MJw1ZZXiNNyVGDange3pY2lfAPxgn1XkQqem2J2+9t
	SvU6ZNDWjNxHCywkmfqe3BaugenAcWZzijr7sfDIUBHiZ3WY0zAxw1WjGDkYk4EpO+2YXH
	rzuvCz1opCTPfoq4OYJAlCAzjJnSbz9oK4iXUo7K6Q151y5f6qKGjmbjLnB1rKUaE5Ccyr
	Tci5Iiefaqvvn3cMgN9xyuiZAvLyX80Ykr3y1NfvntXQTHzGXyWJaRcWvud1kRpFRen5OE
	mz180vFyYRUfhop2pYi7leqwbb0JF+6OcnlCuXYXSjn0kOfJKNbKI+zDiJzRLQ==
Message-ID: <21e24f72-aa91-463d-a7a4-d4c2f877e527@bootlin.com>
Date: Thu, 12 Mar 2026 11:39:40 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] mtd: rawnand: sunxi: do not count BBM bytes twice
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Wentao Liang <vulab@iscas.ac.cn>,
 Maxime Ripard <mripard@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
 <20260305100137.2558423-4-richard.genoud@bootlin.com>
 <87a4whnhu9.fsf@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <87a4whnhu9.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Le 09/03/2026 à 16:27, Miquel Raynal a écrit :
> Hello Richard,
> 
> On 05/03/2026 at 11:01:34 +01, Richard Genoud <richard.genoud@bootlin.com> wrote:
> 
>> BBM is part of USER_DATA section, so we should remove it twice
> 
> Maybe you mean "is already part" and as such the end of the sentence
> should be that "we should *not* remove it twice"?
yes indeed.

Thanks !

> 
>> This was working ok because we are on the safe size, advertising that
>> there was 2 bytes less available than in reality.
>>
>> But we can't change old platforms, since it may lead to a different ECC
>> strength, so, introduce a legacy flag for old platforms, and switch the
>> new platforms to the correct count.
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> 
> Thanks,
> Miquèl


