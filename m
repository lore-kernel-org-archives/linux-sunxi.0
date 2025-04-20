Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACFE4A11
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Apr 2025 17:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745169473; cv=none; b=RRvRNkM0i/9b7vBa48WVx2Kwh57NdxlvHMDhoyfvaRXTnQfBvKGMFxubR1PW8av5c0J94P5V1geTAMkIRZDVdDerkiPjooyWzsz80JozFDQmPSAhXhxBk8jBHZRQVgMEHkHUazdwtu1kXNYTyk8hnTg4vmh2J64Jy6mUOCGoyzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745169473; c=relaxed/simple;
	bh=vicVh3jDUH0fdfHYZEUOnXF+nnJsdoo5d7tw9rYs0lI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=cgrzUze2dfPmBYyYQmwB/Yyu3SlAg97F9mKxJSYXwmxCzgclsTfW/5XtVBxsQIaFFES1L9AyBnDPIDj5rXu7dDa4XTJuUK0/bATVH1ViZxdOtfIhkZMVbt/ONRlWL4Fosi1lPjcKK2WcWAssUpv0sCI2pFWZRPNXQi7MG/cW4Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=M+CCltMe; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="M+CCltMe"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1745169469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UjLrWMwnOdyPXmg9OSM+mcr+ohUq3DRJbZapfAmwaH4=;
	b=M+CCltMeK35q8jJfYJNdDJQGnKCKXyIAIolLIH9oDy1hUycv6F4cZawK/npxGQnTElWtN0
	EqgKJh7NZ93Gt18DxlBrz2bdB/z1BWbf1qIwfzVHSi2YeRNMlB/S3RTxRiRKwMs91IT00y
	wNpTzs2Nb7QYmKO6g/7MK4acaHWkxMgzfjKdcbdmFEdDABoSU7M0eYnQjyzO5BdpdUoAe0
	ZmfC07DNfGl9chvZUPIU0fJH9FoqFnoVVMli70WbVsaIiTcvx3Kg9MS8zHkmsy72Y3bH6t
	+T9vrH+GOqonO9y/ei1E4ymdKgZmz/n1rO1cZC1TC29Zul+GwbWz0FW1/LQT6w==
Date: Sun, 20 Apr 2025 19:17:48 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on
 SoPine
In-Reply-To: <CALeDE9Nyt7Di2_u-Vf=6OCAg-6wmbz75Cs_MCfZrk6upbD9nZw@mail.gmail.com>
References: <20250419160051.677485-1-pbrobinson@gmail.com>
 <20250419160051.677485-3-pbrobinson@gmail.com>
 <5dd7825c9fcc83764fbb4b0b53704152@manjaro.org>
 <CALeDE9Nyt7Di2_u-Vf=6OCAg-6wmbz75Cs_MCfZrk6upbD9nZw@mail.gmail.com>
Message-ID: <e111f8b9f499a158af5fad1942951e0f@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Peter,

On 2025-04-20 11:33, Peter Robinson wrote:
>> > This adds all the pin mappings on the WiFi/BT header on
>> > the SoPine baseboard/A64-LTS. They're disabled by default
>> > as the modules don't ship by default. This includes, where
>> > they haven't been already, UART1 for BT and mmc1 for WiFi.
>> 
>> The patch subject should be improved a bit, to include
>> "Baseboard" as well.  Having just "SoPine" is a bit too
>> vague, and it should actually be written as "SOPINE"
>> at all places in the prose.
> 
> It literally has baseboard in the second line of the description.

True, but the patch subject should also contain "Baseboard",
because SOPINE is a system on module, and the SOPINE Baseboard
turns it into an SBC that actually has the add-on headers that
the patch addresses.  I hope it makes sense.
