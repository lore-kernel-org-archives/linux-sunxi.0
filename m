Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AD61FDA
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 07:46:15 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id u1so13715776lfq.4
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 00:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=YAMyBg9d44MWhyRNdyo4vUrOri76/3hzE0yf310ysjM=;
        b=QFpzLf54P+bbDcylPIHneeogkIyWz/Vz+U33ZOgN0CeyJcbv3T6m4wrwcABEDFOypO
         MHWNmqIk+NzoJ2ZI4jVm63uEDmjzTJnQicOTGoWSGjcgeAUQNGZYgvm58voPA8ai6g8H
         +4UsuB7VieMFg+yCDBcAYNCa/itCy5rCnIjtlPAe0j+V7qLBy4T78QEmWxGGDDoPGctc
         g/Gkqz9Ab4jO3ZV7GNcTF5Dno8nH8YPbjT9c2mIUZkcSQ9/AXK4rJNxPtcchrY5uzAyK
         8Z6Ab4w04E4RSkLeFH0jpA9cwxYYPYmjtnDQIvOsHWYVfTl66UbKR2GFvBcp0/21tAy5
         rMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=YAMyBg9d44MWhyRNdyo4vUrOri76/3hzE0yf310ysjM=;
        b=OdFZQx/t+jHzeaS2iBjuJhE2cX6WrvIGjA4w2hOPl3K/QtO4L1XnNcopVQvrvlhM+O
         KJTH1epbfD9aEIT296aCVtKQwEW7oNM577z1mR4VbnajGCQg/5mzdL3+35e985rFeQoa
         tlJh0dhKIHCBBQpzyHzJrQJtqQglRaEjaRgvyClalsHL4gYSK6eC4+YwD6OHOdJsIhtt
         AlmNxtXuAUpphBY1169YbP9x3xu1f8GlAJA8wK+sAhr3BI34JbhU+qaRdYkF/3uw+KBy
         DZdVJPRIUK9oIy0iPr4t855lllUOalUj784qMeXI0kI0FFMARiZXeauV94Wwz4ThSzEr
         L3oQ==
X-Gm-Message-State: ACgBeo0vaB6NbjA37yN6YlTAl/R/SeLrJ+g0VrU4ElS5dt9WGZB/RtQq
	cqUDMezKYzyZTJbWwee8SZR/jw==
X-Google-Smtp-Source: AA6agR4cOy9qNK8UF3HTGFuF8YJarzziF01JWegFA9uf3mBt5gGvKcX7g0gz3fwRm3w0slKB3/qGOw==
X-Received: by 2002:a05:6512:1393:b0:48d:6f0:64c7 with SMTP id p19-20020a056512139300b0048d06f064c7mr6584168lfa.20.1660635973191;
        Tue, 16 Aug 2022 00:46:13 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id a25-20020a056512201900b0048a1f17916esm1298396lfb.300.2022.08.16.00.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 00:46:12 -0700 (PDT)
Message-ID: <8403196e-2342-f544-b2ac-4848149b7dde@linaro.org>
Date: Tue, 16 Aug 2022 10:46:11 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 02/10] dt-bindings: sram: sunxi-sram: Add D1 compatible
 string
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>,
 Icenowy Zheng <icenowy@aosc.io>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20220815041248.53268-1-samuel@sholland.org>
 <20220815041248.53268-3-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220815041248.53268-3-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/08/2022 07:12, Samuel Holland wrote:
> D1 needs to export a register for managing some LDO regulators, so it
> needs a unique compatible.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
