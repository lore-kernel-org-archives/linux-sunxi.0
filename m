Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE2E7EC
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Nov 2022 10:42:01 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id h12so11649249ljg.9
        for <linux-sunxi@lists.linux.dev>; Sun, 20 Nov 2022 02:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+5N0pkOjScN/Ao+IwQra3FduvJZ9s4atoSpkPxjW0g=;
        b=OX0QN4FcMzvJqw1Acb4lbEaCiASIfpsUmGgO/uD7diiSl3/q27ujnTRUDc06O3T7yS
         FppQtc2kPLzFgaHiPK+xAynMPZMBpPLzyUtoBGHVyqPcVcpO/+WE+58wcOJVYVO20E1z
         Lj5+SjYiyefP/NVAvVvfVPIBk4aJCYgWyTEeNYlG0XbVU04PnwCLuABo+cLiP2yewjF+
         CVez272raUl24nJjK29TvEvZNKXp6jS+QdIeIfrKR6SfrhF0yjrRxwJV5fxDeFmsLf8z
         Nk9LrTiNnZLiLLMezKuU3G7dF50wLPKnkALVTlR3x8HsFUcLQGrKKpfxbCOcubZYNkgC
         QEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+5N0pkOjScN/Ao+IwQra3FduvJZ9s4atoSpkPxjW0g=;
        b=SgHqzBb1fVuc3h8hIdr91qsSqi6ZzS1xCg+ruIjPVsh5Nq0z+cD1wGKG8gzreofqV6
         DcPZWmI1KdqbqBHJSOYXnC7cO+IJJUmjrAUZTppb5B3v3VT17w+pJwH5ra4c+6ATmqZy
         h9xvOSmK87TffOJr4kSNLvZcHHvHFtBk8QL714hwWUH8rABI6AxhYM8p9waL4J7bZJGR
         qMhWxlfkLEqvKSoZVpuzMPxAGQc7fIN2rshaM6i80Pusrd2lAAByJhfpXq9UtGvpfzWG
         9ilNjrkJEJwWm4ORYV+kc19f7+lGUmnQaxwijdXmRdKHWH72aRXwpK5rsdi7lEOtcfvk
         6Keg==
X-Gm-Message-State: ANoB5pkoITpeL5HOEYEcTzK6lwcr/BdU2lpJr8Nl8O4wrZcGwlT8R71J
	cmJc3hHdBisbpMb0rdJn5Nsp4Q==
X-Google-Smtp-Source: AA0mqf44vIeKbqxUNJCmzEWNr/HvLPcCO+Csm8bNrTotxiewRQh8XlbSuKG36uhmQXT0DdKbqFHCWw==
X-Received: by 2002:a05:651c:1a07:b0:277:11ae:d44e with SMTP id by7-20020a05651c1a0700b0027711aed44emr1241095ljb.458.1668940919692;
        Sun, 20 Nov 2022 02:41:59 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o7-20020ac25e27000000b004b48c977d8dsm1497974lfg.125.2022.11.20.02.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 02:41:59 -0800 (PST)
Message-ID: <71f97720-37bc-7940-57de-4667b2204132@linaro.org>
Date: Sun, 20 Nov 2022 11:41:57 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: add binding for SOPINE on
 Pine64 Clusterboard
Content-Language: en-US
To: Renze Nicolai <renze@rnplus.nl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <maxime@cerno.tech>,
 Andre Przywara <andre.przywara@arm.com>, Conley Lee <conleylee@foxmail.com>,
 Andrew Lunn <andrew@lunn.ch>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <3007229.e9J7NaK4W3@werkpc>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3007229.e9J7NaK4W3@werkpc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2022 13:31, Renze Nicolai wrote:
> The Pine64 SOPINE Clusterboard is a mini-ITX sized board capable
> of hosting up-to 7 SOPINE modules. It is largely compatible
> with the SOPINE baseboard but it omits most of the in- and
> output interfaces. Also The Clusterboard needs a tx delay
> of 500ps for ethernet to work.
> 
> Add a binding for SOPINE on the Pine64 Clusterboard.
> 
> Reviewed-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Renze Nicolai <renze@rnplus.nl>

1. Only this patch made to the lists - second is missing. You need to
resend.
2. This looks like v2 or resend, so please mark it appropriately in the
subject [PATCH] part. (git format-patch -v2 or --subject-prefix).

Best regards,
Krzysztof

