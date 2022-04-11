Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9BF1114
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 06:38:23 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id g20so17047194edw.6
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Apr 2022 23:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2WmKSNoZ9cWKL6JDASWnjI9NvSq7+tORNGnSjM+acks=;
        b=ODfe/DkGj1RuBxSc5J0EXQFnY/vL7RySjU4xh9bzSJOuWwZ4VAsC9/m4/eaLQ6CJl9
         QyrdjToejG5d1Qb/An1jX6vmjM2PDYFSJ9r+/5+rBxbn27zdhA/UNDf4zatsjZb2NBUh
         AbnvBXsf3y7KxVV7kVCuECnSxjbsZrs2szLVjgo8CohvcUfKrDT83QYnDYXfXQyaqJlH
         E33P1hJJjjxMEloiqUY9gxOFUCSsABl4hT7x7CUdyDYHqJD4eG9lJegQSh04Fwur0G4B
         8KGgJu0DtZN1p/FreHJOKXR9EhlgXXQ/wvLc4s5uuw5HufDXrQhq46vZWpzlqJu60raR
         Vbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2WmKSNoZ9cWKL6JDASWnjI9NvSq7+tORNGnSjM+acks=;
        b=1Ixk4ZNRP5TFJf4Ufj7UqZ7C0YBOVRhRTEMVLm1ZDwB3ktNqgGnf4crdvSCEV5cwFT
         g9Tk0PCl8DXpRKsg/yvhGCFtMZ+dDJJVuhDDCqTrheupmMPn/298MjeZ8Ta3AKJSZL/9
         MJNXYb3CiwYQ9emiuR87gJBGZhpc87ZdXBwvEUGasrmO4Ee3OHb/asi4L8eApeUQMV6h
         riaWg7fGwAjzKv80HgOCgVe4krPqC/kBx/oYMeiLV+5kiZA8ydp9TQ6lcMANalqd9EH/
         UuGTR1Cu/9uE25Q2QQlU7j5B3SToKgy//kY3ub2bvI4D/rUFQxeweoeRnMX51rIRG26R
         6fkw==
X-Gm-Message-State: AOAM5315HzVeg1QKs/MP681ZH39V/BCxKpARu/d+lOyqew6eS8vfh4O8
	3r1VdeRDVCv8d6tHUQMnBut2rw==
X-Google-Smtp-Source: ABdhPJzXMCIHpbGK3+ThRU7zl6dOmK1ntfsv7TgaQBc60TypCniiSSzMFXl5kMoMEEbKtARXkujolQ==
X-Received: by 2002:a05:6402:ca9:b0:41d:76b5:d17a with SMTP id cn9-20020a0564020ca900b0041d76b5d17amr6338713edb.259.1649659102201;
        Sun, 10 Apr 2022 23:38:22 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id o18-20020a1709064f9200b006e7f229b332sm8337293eju.36.2022.04.10.23.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Apr 2022 23:38:21 -0700 (PDT)
Message-ID: <2693ad68-c31f-1151-88fd-0b18a4249bd3@linaro.org>
Date: Mon, 11 Apr 2022 08:38:20 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 02/10] dt-bindings: display: Add D1 display engine
 compatibles
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20220411043423.37333-1-samuel@sholland.org>
 <20220411043423.37333-3-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220411043423.37333-3-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2022 06:34, Samuel Holland wrote:
> Allwinner D1 contains a display engine 2.0. It features two mixers, a
> TCON TOP (with DSI and HDMI), one TCON LCD, and one TCON TV.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
