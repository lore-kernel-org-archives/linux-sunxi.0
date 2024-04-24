Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15360157A58
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 06:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713940735; cv=none; b=LSuOwTM0Kj++8OuSgZYQm1Jrrgcqqyi0q47JcVhiaVIk+imNbuYCxMtAHVCVbBu9VAoLmkRLiyD0Lui1rrvAYlpEy1zOq0wPgjQe9sEgJdE9PHYU48TOs8lmOMUf1W/wJgE1J5zqlVTFYDeMRx4mA2o3PIEcAP8CEQGEWYBOxSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713940735; c=relaxed/simple;
	bh=rC5tzq4Cf7BvDJ7FwCyol72j79dOirBMRNP7eb69s6c=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=fRIBc4aKuWypKCKfHoG7ajiTaS2I4AQT6USohupvS+EjkJsEnm13wqn4FFSLx8M5zMT8nu/eeLNCBB+tX4eagjvNAU/I4MzCmzXPLlFhLv8p44Ld0SIzTdm6EFz5hysjGidFKkYmtK8s35OEUQwKRq4nd+c9pOlmQF6QyUJuZak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=DiOyv9zD; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="DiOyv9zD"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1713940730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l1Vyu63Q32QupR65EIJSgXlEhYqlOuM5tRxkdyCNnd0=;
	b=DiOyv9zDyJ/aamVdfT4tePMfcY2KersMVVY9qgLWqzG2BYz4ldDtGia/O9Ed4yyuGg+B07
	+3+Y4fuhKHWpnfj5vRCXecc+ToniL6+1nF/0OHnHtrW9rbTmuHKFgyr7fJaW1NE7MpADTd
	uHjKIXmhQH6WR1nfBdBaaW/crpNTCG+SbWOV2LS4+pjUtX7IffjMUMFhuRy3X5f+jWLhE0
	Gx9halomoRA1gQKLmMNkRG+ejrHxj1DyaALcYMrA7ttfp5fWY21qrP1WNMnAumbib2+wor
	Mq6t2YNo5NPA1E8AqAs1kT9g5h1BuNspcwIcFjzlA8AghJsHR01ktbWVYLyOag==
Date: Wed, 24 Apr 2024 08:38:49 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, samuel@sholland.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, robh+dt@kernel.org,
 jernej.skrabec@gmail.com, wens@csie.org, Marek Kraus <gamiee@pine64.org>,
 didi.debian@cknow.org, krzk+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: Correct the descriptions for
 Pine64 boards
In-Reply-To: <171388501868.266715.5097987585598723774.robh@kernel.org>
References: <d2943d9f4c99a239f86188eaf45a73972685c255.1713833436.git.dsimic@manjaro.org>
 <171388501868.266715.5097987585598723774.robh@kernel.org>
Message-ID: <23b4798c1e116706f6b48cdd4e05e9ef@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2024-04-23 17:10, Rob Herring wrote:
> On Tue, 23 Apr 2024 03:00:19 +0200, Dragan Simic wrote:
>> Correct the descriptions of a few Pine64 boards and devices, according
>> to their official names used on the Pine64 wiki.  This ensures 
>> consistency
>> between the officially used names and the names in the source code.
>> 
>> Cc: Marek Kraus <gamiee@pine64.org>
>> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> ---
>> 
>> Notes:
>>     This completes the correction of the descriptions of the Pine64 
>> boards
>>     and devices, which was started with the Pine64 boards and devices 
>> based
>>     on Rockchip SoCs. [1]
>> 
>>     [1] 
>> https://lore.kernel.org/linux-rockchip/ec124dab2b1a8776aa39177ecce34babca3a50e2.1713832790.git.dsimic@manjaro.org/
>> 
>>  Documentation/devicetree/bindings/arm/sunxi.yaml | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Thanks!
