Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C6312E1E5
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 09:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713344784; cv=none; b=u1BNxUPWIs95RbUMotwXQFFr93tEiY3rymR+EhY5/96w6AwY56ScSDOXtRubng0otR81ITC6Uijw0FbdB4Gzb/4LDQLSrxzvty7MvPx0Mn0BwSQHzLvlZcU/skH9k5fF2MOHveyXgr5c/gmyL2bmU+oWH5eyIg8Xow+w2/E9YuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713344784; c=relaxed/simple;
	bh=qIBHwhxOXwtY0RHpY9eA6byA5TqhTAs8M5/9vkRw3kU=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=BpW+q4CS4l39QQbm/tYdNLwQA9MXaa72Ed+WA/rOMJ5O2OU3ECPCqCZ5ggIi0U7jS3ULw3rJK3LUk024lwMwROB+WmYfedkEfvDxXAQQO2p5lgrl/buC+v99lefWIWicze6VOYMB+J6ktyou4rKrAU3KDINo0zxFMriWjS/aBfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=dfXda9Vd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a3J95scg; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="dfXda9Vd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a3J95scg"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id D048118000FE;
	Wed, 17 Apr 2024 05:06:19 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Wed, 17 Apr 2024 05:06:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1713344779; x=
	1713431179; bh=mHY4evkFIM09RAfuUT5ulFoWkjiQLBK1ueGmAQyNnds=; b=d
	fXda9VdwPKUGUU3fYMdQs0EeLTX5P3If9VY553ugdPRTnT1Ewk+bgMKKw9x+p7N6
	Cj2B4kzXq2oHQQPw6tYGTxEomcJLaEMtHa7xVsNpghR6JLDlSJM+omssyeyhP6py
	XapxtKz1+hKp/S2t9Esx8DfyLxx88tLlEZD6DvXZNRBcH+ioCeEX1JFBJG8PYzNJ
	ToLRdVXKJ8pJYiA6FN0r2zV3EWWwfUOLDJkQAa63+PO3aRgSJJgF+MXX9N0ixnL1
	/uZe1Y4CExB/Bv1YhyTAWt2jMjWQXjJxjpMbaY2L2U9SUejyaJqIAWUhg15Gky7S
	7ANj1hajYjma5A98rj2Iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713344779; x=1713431179; bh=mHY4evkFIM09RAfuUT5ulFoWkjiQ
	LBK1ueGmAQyNnds=; b=a3J95scgJTklv8WkPTI5vKaQbActbBIDuCPoeiyqCNHb
	vbCBF0pM6KDoKwS4lNPfO8EqO8aCGpV8AcKRUks8RFNLyYjPbaH/dGZ2OQtBt6rg
	BfJV0ZGn5m35jbacsNGGkajQVr6nWnffhHYKESrUkfhaIF/72wIMreTRlBdfTUBN
	pUadjuFb6wlgsPr9IiOg5zREuv8HqVl7Pjg+0HZjHrZEZlM3gN5jtlBPDKlYdEZp
	k0rQYlg84sZsofntDjAxE/GZ/OolAiDNuoE5JY4wiYzKHU8cfaZwqo+fN1OhRAJ0
	TmHtaIWj7qZ7DDvnJTKLO0RfDhHCQdw6w04Yuk1GFQ==
X-ME-Sender: <xms:CpEfZo2WVkhCImjSrnStii8lEafhYviKUYLbCVi-tzSuge9xLd2Eqg>
    <xme:CpEfZjHkEvDw_F3foUIQMgS63LstSssM0N5iYeNpurBuw6p5lnKymyVjfmt9CVHY_
    4VY2nSJE9VMiv76Cw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejkedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftfih
    rghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecugg
    ftrfgrthhtvghrnhephedvveeigedujeeufeegffehhfffveduhfeijefgtdffteelgfet
    ueevieduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprhihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:CpEfZg6HmwMeKDFV1bDe_BJJUyYilnhPgUHErX4NCdsVDSr7TkZZqQ>
    <xmx:CpEfZh2BWi6hEYY-3azm3bilmPUc3F0yeSApCRsA2olTtZ_0jjsK4Q>
    <xmx:CpEfZrHLiHWeuxdST3FglVdKn4NPlBTjOVlsn7PHTkxpyxE5kZX-FA>
    <xmx:CpEfZq9cUrhcf5hRmBLZk7xKQRbTvZ3LxM_qQerVZ6eClIgmcYUoCA>
    <xmx:C5EfZj-s7SVoHggpRJDbVyAe7rTIm1wHmMrvs4zdsn7NgTRD9gqBlbwY>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 46AEAA60079; Wed, 17 Apr 2024 05:06:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <f0b5aea5-54f6-4c3b-9c16-f7e97c58ea6d@app.fastmail.com>
In-Reply-To: <78b5de01-150e-4537-b6a6-8ca0067a8359@linaro.org>
References: <20240414083347.131724-2-ryan@testtoast.com>
 <20240414083347.131724-3-ryan@testtoast.com>
 <78b5de01-150e-4537-b6a6-8ca0067a8359@linaro.org>
Date: Wed, 17 Apr 2024 21:05:57 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Andre Przywara" <andre.przywara@arm.com>, "Chen-Yu Tsai" <wens@csie.org>,
 "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>,
 "Chris Morgan" <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/4] dt-bindings: arm: sunxi: document Anbernic RG35XX handheld
 gaming device variants
Content-Type: text/plain

Thanks for the review and feedback.

> Any reason these are not just one enum with three entires?

No, this is just to match the existing devices, are you able to point to an example elsewhere?

Ryan

On Sun, 14 Apr 2024, at 9:07 PM, Krzysztof Kozlowski wrote:
> On 14/04/2024 10:33, Ryan Walklin wrote:
>> From: Ryan Walklin <ryan@testtoast.com>
>> 
>> RG35XX 2024: Base version with Allwinner H700
>> RG35XX Plus: Adds Wifi/BT
>> RG35XX H: Adds second USB port and analog sticks to -Plus in horizontal
>>           altered form factor,
>> 
>> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
>> ---
>>  Documentation/devicetree/bindings/arm/sunxi.yaml | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
>> index 09d835db6db5..fc10f54561c9 100644
>> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
>> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
>> @@ -56,6 +56,21 @@ properties:
>>            - const: anbernic,rg-nano
>>            - const: allwinner,sun8i-v3s
>>  
>> +      - description: Anbernic RG35XX (2024)
>> +      - items:
>> +          - const: anbernic,rg35xx-2024
>> +          - const: allwinner,sun50i-h700
>> +
>> +      - description: Anbernic RG35XX Plus
>> +      - items:
>> +          - const: anbernic,rg35xx-plus
>> +          - const: allwinner,sun50i-h700
>> +
>> +      - description: Anbernic RG35XX H
>> +      - items:
>> +          - const: anbernic,rg35xx-h
>
> Any reason these are not just one enum with three entires?
>
> Best regards,
> Krzysztof
