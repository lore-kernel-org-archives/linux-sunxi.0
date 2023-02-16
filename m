Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E2A7B
	for <linux-sunxi@lists.linux.dev>; Thu, 16 Feb 2023 08:39:57 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id my5so3351703ejc.7
        for <linux-sunxi@lists.linux.dev>; Thu, 16 Feb 2023 00:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LBXmSjxP4oQwpZyGKuVQarXmpiHMmQiRINray2EXZRI=;
        b=E9BSBVEDRiQfpC6NWMMtL6J/fkUXbDzFqT+ZCZYeTxkStbDo2zCQgnaKjAOwI2NgUl
         BFINBxuQRTBbt8hdFzo3FOGKMywELfU+fDXgYj/0ZcT1chHbiuQ1HyJRb6oGvswTPGr3
         0Vqj5MD1qNhWMt46tLaT9cuN+FqzegKFuyws5P6buTgCRr8sNFD4cI2GUS2wZAuB0fkW
         pvu4jCP67MgL+fY6XwL/mkPl7bfnfhJM84UfSV/CcqkfVIAu1FMl6TvdvXrCPPFwXTAI
         Jb3pEBwlKzPhvmTomO8FJRleXw+vQnJANyr7xG1hGfl4b1KaUWmTI/FcMmn5atiIsLYR
         R8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LBXmSjxP4oQwpZyGKuVQarXmpiHMmQiRINray2EXZRI=;
        b=Q8hKJBYs/9m+HOuYUQUhHuJQc4F6B5/SLEhcS9RQYQwU1qN0HXGHcbNPfrbV0VrZ+9
         NQP7UpX6c8mCbaYNSDqYMxvMQB6wIMhwe9O8zPHcSTtUO+SEGTi5HSAzj5BPqt7wCmBm
         BgnYE/H9GYaVTtZs5R41O+I9Kfr34kL0oH8KIp0LplOcYq9zBu4pPuO3pij3PRs37MvP
         ppRhpIgh9xJD8mNaJjj5WoM5mU4bs5qNI5zhF7Uwr7QG6opIBL4UIElXZ/7G+7GknS/N
         FEoLCGz2k4pO1Kn3kvpqBu+QENeGBwaTOjF+bM927cZzqbd7OqRtZ0ZSy/x8UrmUMG6F
         oG+A==
X-Gm-Message-State: AO0yUKUL2g8IMrPvtpwuk2dON59Er6eFBb4iEM++a6bFk3ZzPzPSzxC7
	HDM5EaDd1qMgOBordFPn1xdk2g==
X-Google-Smtp-Source: AK7set9Vk7cPr0jfB62hOqufH+6uY6bemdi0YLoSE5G556cDl4CHT7iFm+KvS9EG7aTdtRmTrqELUA==
X-Received: by 2002:a17:906:c353:b0:871:dd2:4af0 with SMTP id ci19-20020a170906c35300b008710dd24af0mr5348190ejb.26.1676536795779;
        Thu, 16 Feb 2023 00:39:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u4-20020a1709063b8400b008b1709d45bcsm189361ejf.213.2023.02.16.00.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 00:39:55 -0800 (PST)
Message-ID: <500a29f4-d680-e2fb-2b6d-5f5309a646f8@linaro.org>
Date: Thu, 16 Feb 2023 09:39:54 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/5] dt-bindings: hwlock: sun6i: Add #hwlock-cells to
 example
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
References: <20230215203711.6293-1-bage@debian.org>
 <20230215203711.6293-3-bage@debian.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230215203711.6293-3-bage@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/02/2023 21:37, Bastian Germann wrote:
> The dt-bindings tools will compile the yaml dt examples
> and this prevents an error about this node not existing.
> 
> Signed-off-by: Bastian Germann <bage@debian.org>
> ---
>  .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml          | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

so Bjorn can fix his tree. Can be also squashed with original one.

Best regards,
Krzysztof

