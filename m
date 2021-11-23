Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42822C82
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Nov 2021 16:43:03 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id g14so94817599edb.8
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Nov 2021 08:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MC5epeKImcx3/KQhLYCZ1HLgX1y87eAw5+H5JNQv9sA=;
        b=lFopLDuY6MPMp7pIgftj6vLLHx6gwKafB2NAA3QebNbR4G8rQoWE+xXn1ZNViGOqPE
         LBILL9hVz83u8+PUceyxvc5xIeneoZ6NfOHgoHtjbeTfWDHnYy0Ug0gn+KsvcyVXY0Ci
         GANzc7vFdpFCe+aCCwqtJSxkIZR+uT4nJYlXxzib+9RLLxPTTaBUYHwXNrwf1gwPKnEv
         sl6oTBhgjLZghpGlIDd0Ztz0iEbRW8HwI7mfY2kcU5yfVWpd6OqqfEuHfYZdzzi7INrn
         hnDJclq9jNI9Eo2FLSym6dpNL2/kUxi32FxPwjR80F6zFDCNuQcH84OZobb5M6ZFm89E
         n50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MC5epeKImcx3/KQhLYCZ1HLgX1y87eAw5+H5JNQv9sA=;
        b=h68Tt0kvDg9u9bdPW+dF0TGGE/QzD7yumhUEZ3BbGw6bGYYmgW5t4WPWHisiPVw+zQ
         NP3A404o/nuNZGro+skim2b7GG8s6fIIudR6ElhAHAs4ecgHBY3oUxymLb/HJ3SKPbmd
         toDlhxbzhC1j9QDZUlLMfBcDb5JckQyOB92VERZE5ToW4AaxL6JB3EN6dSvS7OnvKLzz
         T5TO5XvSZ9OctBm8eCpPMav4u3r7L06zWjyocTLSWg6bA1Au0J3z2qfkdJuJsDAVBSwb
         bSuYyh8Q4q3vxqpa7rYVOAxjzlRZhwMJkT3SGKO/bJ8MU8CQ6ITlXeVrD3ZIWXZzr4Au
         LgnQ==
X-Gm-Message-State: AOAM532ciAuTmu8g9I6XBSQbL487SoNn6GQ2VQ6+QlJvh1CuhGzzcxpl
	UOA64fUsSnebGihtvI7OPfk=
X-Google-Smtp-Source: ABdhPJw8TCJCwiaCGpqcYo8YHmkWjG3beYZVJAdIgmxdbcP1nkoBberCXFC9tmHu6n1fgwJ+WIwoqQ==
X-Received: by 2002:a17:907:7850:: with SMTP id lb16mr9444354ejc.67.1637685782143;
        Tue, 23 Nov 2021 08:43:02 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id d3sm6074046edx.79.2021.11.23.08.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 08:43:01 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: wens@csie.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Michael Klein <michael@fossekall.de>
Subject: Re: Re: [PATCH] ARM: dts: sun8i: Adjust power key nodes
Date: Tue, 23 Nov 2021 17:42:55 +0100
Message-ID: <3138437.aeNJFYEL58@kista>
In-Reply-To: <20211123103219.4y2pjywt2uxunc5s@gilmour>
References: <20211122213637.922088-1-jernej.skrabec@gmail.com> <20211123103219.4y2pjywt2uxunc5s@gilmour>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi!

Dne torek, 23. november 2021 ob 11:32:19 CET je Maxime Ripard napisal(a):
> Hi,
> 
> On Mon, Nov 22, 2021 at 10:36:37PM +0100, Jernej Skrabec wrote:
> > Several H3 and one H2+ board have power key nodes, which are slightly
> > off. Some are missing wakeup-source property and some have BTN_0 code
> > assigned instead of KEY_POWER.
> > 
> > Adjust them, so they can function as intended by designer.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > [BananaPi M2 Zero changes]
> > Signed-off-by: Michael Klein <michael@fossekall.de>
> 
> This looks a bit weird. If Michael is the author, then his SoB should be
> here first and mentioned either in From or Co-developed-by.
> 
> If you are, I'm not sure why he's mentioned?

I'm main author and Michael just adapted BananaPi M2 Zero DT based on my 
changes. What is preferred way to mark him as co-author?

Best regards,
Jernej

> 
> Maxime
> 


