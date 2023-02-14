Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EE115B7
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Feb 2023 12:37:24 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id a2so15487773wrd.6
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Feb 2023 04:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xInKaoWRFzme6mIUm7OvAINv5mpeXK0Tng+2l6vEAa0=;
        b=gZV6z0QWrknIs9h/NU+od0HfegjoCaCDrkFu198RQqpWGXpl0yEhVtHl2xmtq8Fatl
         rAUIOO+6uEHw0f4M+L0OfJ1W6jOp4/r4DmzzYZiHxYDp21uLK/oue47gQSua52DKDuiD
         r6TIE8yn68NOPMqov6sV4X8fGicOsCHqkORgp3e2GVrkWb5CUqFH5PhktiY7MKdY/7aS
         OCEra0XRmQfq/EvJ5bu5t0OpUWoFoO+/4ryHvo8mUay/kxUEKr66OisOQST1N7QJUorq
         UxodXtKy4OB0SdeKPCSRTFShHX16j2v69IXLK8uR9MN8pxSC8cCLB5tYTxBddZ4+gkHa
         +5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xInKaoWRFzme6mIUm7OvAINv5mpeXK0Tng+2l6vEAa0=;
        b=qJz+FC23yydYWmNtoBTZz+8WQYIpIRodgGm9ihcqxmK2N/nBc8PahaIxtLOY4eWpb7
         fAzCTZkxb5maay3fugWs8vegxaG7iDdMRqMu8Yp6Ui919uWBy7qOMiQ8DDU1+UKwtTCW
         KTPqsSgQub3RZ7BjqV9ES1P96WvRrhe/RNSXqSRlqhNNAOEPggrJCH3ExCIPxNa0d6vY
         TqdlxhpryHRW5ossKCWaj0PLEC/nFefiLUwkvi29Lly8tvUF04wzqqnmQJS6LqrA85J6
         ZDIF8tqrdfLyQFtSmcAbd0is+ENyAuGn7cQZiqNcKxJEYoE77GA8KdNKvxTZ7tDvvogK
         ZMRg==
X-Gm-Message-State: AO0yUKXd7wdtbvfKvqXcBc6b748DPRj/lWS8gM+wV77Lw5iAxuUprn/G
	wUL2kh617BF/Y90CUumZMULhnw==
X-Google-Smtp-Source: AK7set8ZlnnW0PPA2OP75yQKJw5482gR33b4oVVNTW2O1F1Qv25Me85WqfzppT87BSzPPFWMmW+6Lg==
X-Received: by 2002:a5d:4048:0:b0:2c3:fd2f:f7d2 with SMTP id w8-20020a5d4048000000b002c3fd2ff7d2mr2066707wrp.52.1676378242970;
        Tue, 14 Feb 2023 04:37:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e1-20020a5d5941000000b002c54241b4fesm11886160wri.80.2023.02.14.04.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 04:37:22 -0800 (PST)
Message-ID: <43336959-643d-4041-d11a-b0c030fbf050@linaro.org>
Date: Tue, 14 Feb 2023 13:37:20 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] dt-bindings: hwlock: sun6i: Add missing names
Content-Language: en-US
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Bastian Germann <bage@debian.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <andersson@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
References: <20230213231931.6546-1-bage@debian.org>
 <20230213231931.6546-3-bage@debian.org> <20230214104554.35338faa@posteo.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214104554.35338faa@posteo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2023 10:45, Wilken Gottwalt wrote:
> On Tue, 14 Feb 2023 00:19:29 +0100
> Bastian Germann <bage@debian.org> wrote:
> 
>> The allwinner,sun6i-a31-hwspinlock.yaml binding needs clock-names
>> and reset-names set to "ahb" as required by the driver.
> 
> Hmm, this one is a bit odd. If you look into my earlier versions of the
> patchset, you may notice, that I actually included these bindings and they
> were refused. I think the argumentation was like
> "there is only one bus = no need for it".
> 
> If it gets accepted now, I really like to know why. (It was some trouble
> back then to get the documentation properly done and accepted.)

The clock names and resent names are not correct. They should have never
been added. If you got comments about this and did not update driver,
that's not nice. You just shoved incomplete bindings. :(

So indeed to avoid precedence - people pushing fake bindings and
avoiding review - NAK on this.

Best regards,
Krzysztof

