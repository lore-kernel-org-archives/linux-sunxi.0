Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DCF2117
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jul 2023 07:07:05 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fe1a35a135so5948191e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Jul 2023 00:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690787224; x=1691392024;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E3GEO4RHgr782gFDfrXsNOCR5xhrbUR8zBK5vFyqF5E=;
        b=Rc40TX9h6wZPcD4/Qk4hipl9QOUWj7zPJ56nQ40/W7Lv7xJ/LnPtsgfrcYG7CsVtqL
         cZIywVB3P9gTDZMhJsqcj1tHmd0xe7hBwv1jgTrS0YOzOU04EBCRNFOcjB3XSDqCOoNH
         XwO/wzfWeVj/9aua7LcTg/PNxJ2UTAZEWGcPTO9ud/dSctnT4HlJwI/+0fAaEy5nyKj5
         LNrccKndSO4A+v5TQ3Y1of0HaPwo6J1F1dFwnTsMY8XXFNamx3XRpR91q7porR8ytbAo
         Bp8zSRaeDeu6UbGr0yXLPiWvU/viaGMpszhq9eeEjv08I/hSlvsHo2zeJZUX08yFUYge
         owkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690787224; x=1691392024;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E3GEO4RHgr782gFDfrXsNOCR5xhrbUR8zBK5vFyqF5E=;
        b=JJ13IlqfXt1FXg50Jhlm2Ze1b2b5aMVjXWISWN6dIzHLlRUE0WE/7Iloj3dVewKy/B
         Oq9JrATfcW9yL3svpX8HJNaMDu5qHlTenpIfYZncu1k6tMagm0yHV5/ht7EoN48/N4tM
         YR/c9L9wryiF7G4UZJdwZnSC7rrqmqT45xoxJCB0aQeKWRcExRRAbUhVJGnww5aJBZ+9
         sGI6gZa1DJ0JZmbCtp4THG4/v/6abd28TamwZKKSHoS+8fv1el7ZEjpiYvdaKYvz+ETu
         aYxPLexKK0UtCrwL1gHR7keo/btO6WVhpawgpGFGt8owryi3Gbh+JyYM3RsZOryTQmmJ
         r/Cg==
X-Gm-Message-State: ABy/qLbRCUHV28RMZ/V7PXKxVykHcxYZDporhEQY78aIVS5APcmPoYAa
	j1taN6DDwYDFB+hLQlid6I6tjw==
X-Google-Smtp-Source: APBJJlEuVCd0Zgv+jcQEVHsaTSJmHxRvVHkkUHmBcQwGVrRV0K834hzUCA/TiZwhIbeesOa0of3eqA==
X-Received: by 2002:ac2:5e3a:0:b0:4f8:4245:ed57 with SMTP id o26-20020ac25e3a000000b004f84245ed57mr4677010lfg.35.1690787223945;
        Mon, 31 Jul 2023 00:07:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id p4-20020a056402044400b00521d2f7459fsm5121651edw.49.2023.07.31.00.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 00:07:03 -0700 (PDT)
Message-ID: <d4ade8f3-6fbf-5524-8e12-f7b6065df30f@linaro.org>
Date: Mon, 31 Jul 2023 09:06:59 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: document Orange Pi Zero 3
 board name
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230731011725.7228-1-andre.przywara@arm.com>
 <20230731011725.7228-3-andre.przywara@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230731011725.7228-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/07/2023 03:17, Andre Przywara wrote:
> The Orange Pi Zero 3 board is an updated version of the Zero 2 board.
> It uses a SoC called H618, which just seems to be an H616 with more L2
> cache.
> 
> Add the board/SoC compatible string pair to the list of known boards.
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

