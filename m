Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC49515B7
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Feb 2023 12:38:21 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id s13-20020a05600c45cd00b003ddca7a2bcbso6097396wmo.3
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Feb 2023 04:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3JK4qryXYLzD5iU8rAnmpJFcYB19cnfs8AtVBw1KyYM=;
        b=xfgGjgj8cpUhFuYEKPN3Bfm9RrKoawwq44cjd1/K3TjKlr0HsMfqCPrUkk8GVPStsS
         /L/rkb83VQ3iAHmZwojeylGTogVRFBnWG+d1my84OIRqk0GTC1egK42X7NJfys4I/Pp9
         E3Al5RwL01b8stP/fQAgocNTBRj4mBU0lb6o+wBkKBKp+uHv45iN/GtUSjvLSTaHND32
         /EV01YLE8r3pT+ovhoePX/2xzP0e4mlenFrc5dFni0/xTPK08nisMh52ryJmM6EG7u9B
         YhCXnM+rDRs9jeHOHok2iAqBH/c0wKTKGO3NGIRhcZXDOAiSgZhQEDnj2xfO/zK7pfHg
         jNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3JK4qryXYLzD5iU8rAnmpJFcYB19cnfs8AtVBw1KyYM=;
        b=6DKC6WAixOPQQwzQzSl7VR4Zvg7tLtVpeW3RQLb/z7Zhsj0RBtiKOhubkByC9XgoKn
         WGa/tFqHbylrM98i1Og15nSfhcaSolh5KuyMDV9Fd6E05xd5WzyharquKYxQG1LxP0XV
         KKfflOhQgfYQHjZO6SC0b3sokip2ScWFZgvJMiSxvXofnvIODETZDqVU8vU3UIw3j48M
         8RvRRgcEgw0orhIzIsmy0/s2FBflwYFoBESIChCL2PxBzMlKK0XyD1VLmQDxJTXBOfz1
         b9u/qv6DFGP5AdxJW8hC9R5PzXcA20QR6J9VLFss2ugFYUc8KVbecmkm/LGOfviDu/Bl
         tChQ==
X-Gm-Message-State: AO0yUKUuE+2sk6i8XMbouWmRo9qaRU54c5B1xPugAcsg6zHkcqALIf+P
	ZKb1pFHeB/oaSQzudaT75xaD6g==
X-Google-Smtp-Source: AK7set/CyqR/CPxfOYZxqdt01FjVdhGujZrKofjR4WBHLpcLa8YCcJv6J4yPDXM2/HYvJgWJbdJemA==
X-Received: by 2002:a05:600c:818:b0:3e0:ae3:da7a with SMTP id k24-20020a05600c081800b003e00ae3da7amr1910015wmp.37.1676378300267;
        Tue, 14 Feb 2023 04:38:20 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y15-20020adfee0f000000b002c3efca57e1sm13193919wrn.110.2023.02.14.04.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 04:38:19 -0800 (PST)
Message-ID: <8128a13d-e088-d358-b098-9f45ec73338a@linaro.org>
Date: Tue, 14 Feb 2023 13:38:17 +0100
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
To: Bastian Germann <bage@debian.org>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <andersson@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
References: <20230213231931.6546-1-bage@debian.org>
 <20230213231931.6546-3-bage@debian.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230213231931.6546-3-bage@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2023 00:19, Bastian Germann wrote:
> The allwinner,sun6i-a31-hwspinlock.yaml binding needs clock-names
> and reset-names set to "ahb" as required by the driver.
> 
> Fixes: f9e784dcb63f ("dt-bindings: hwlock: add sun6i_hwspinlock")

NAK.

Original driver should have been changed, as requested during review.
Since the driver was not changed, we must not accept bindings post factum.

Best regards,
Krzysztof

