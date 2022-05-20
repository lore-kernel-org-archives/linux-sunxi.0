Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9B217C3
	for <linux-sunxi@lists.linux.dev>; Fri, 20 May 2022 10:19:15 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id u7so8429592ljd.11
        for <linux-sunxi@lists.linux.dev>; Fri, 20 May 2022 03:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qC4Olf3TBGA3MotPYbQLIM34p+fB/nDlozQzZDrBQBk=;
        b=TRs4rMcCAVRW9/+gyu2GMjvXZyCPcqFpOTYZ7FzW5y6x5LKb+wP8FpcAt0/ZMVUCih
         ZDif5/ECPUi9qdeS5wmkjHR/hxJFlOmRzDvyttaeChD2/TElvKqvRxVUNACRbBWvFunr
         OxKMY2BJapKXlCAozP+UhfirIr8tSfSSttaBF5fyhZRyyktW0bhAiepbW0x8SIH7ZDuU
         tJp8EyFs8cupA5bFJdcRDF88ZqyT44XkPaqapkL7hkQ+SghTNeb4OxK7K4gWohd47fuA
         4uELozEYuW7ssvi338yBHgQIiM/JY/2btQfzXBM1tLWOH8C0UjWxlZDV4eXFQH84smeH
         d31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qC4Olf3TBGA3MotPYbQLIM34p+fB/nDlozQzZDrBQBk=;
        b=yjSkK08pyyxGYzu6VR3yb8qlo3bpetZ5i2YF88pRshFB2bbK/bb0VdSNn79kvRjsa7
         rZSPdSNLzqkZdA98THjzR+o4Qcv9f2YdhoQyeIT/A+Sv4d1srGs1+R1EKPc/F5NgeD8T
         rC24FJHRDEUJvtXwuEeT0TKCcYOlazDkjUj+Yjhnth+UC1irTdtOKk5XiX9QwzJn/wh+
         bUN3rx1r/SUL4Fbw7sE2xryUOdEGvq4PA/JvKoyiDPXClqNTyIOszM6IEdNR4omIXihY
         vUTUpaVjwkdEziqdiTbYaSPazLz6d3OmusWUGfqWW8fwT+dgeVhX0ip4hdxWwsaH5B15
         xu6g==
X-Gm-Message-State: AOAM531Ycs66V3LS3Lgz9tia8gVj1f9F28G//Okvyng53GdnwxZt0Kda
	sPsq2+spBiNeZCDHjCxtN4+iOw==
X-Google-Smtp-Source: ABdhPJz5R0gOM+LR5VrdWtX2EWAzFoI4W3cbw6McoMSSQnAw/WK6yf40qF0stxViEQS8Atvn2d+6/A==
X-Received: by 2002:a2e:884b:0:b0:253:d431:45f0 with SMTP id z11-20020a2e884b000000b00253d43145f0mr4587867ljj.70.1653041954080;
        Fri, 20 May 2022 03:19:14 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b4-20020a056512024400b00477a6c86f17sm610621lfo.8.2022.05.20.03.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 03:19:13 -0700 (PDT)
Message-ID: <56a6dc27-35ef-68a9-e990-7d989450ba89@linaro.org>
Date: Fri, 20 May 2022 12:19:11 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 4/5] dt-bindings: net: Add documentation for optional
 regulators
Content-Language: en-US
To: LABBE Corentin <clabbe@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 calvin.johnson@oss.nxp.com, davem@davemloft.net, edumazet@google.com,
 hkallweit1@gmail.com, jernej.skrabec@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, lgirdwood@gmail.com,
 linux@armlinux.org.uk, pabeni@redhat.com, robh+dt@kernel.org,
 samuel@sholland.org, wens@csie.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, netdev@vger.kernel.org
References: <20220518200939.689308-1-clabbe@baylibre.com>
 <20220518200939.689308-5-clabbe@baylibre.com>
 <95f3f0a4-17e6-ec5f-6f2f-23a5a4993a44@linaro.org>
 <YoYqmAB3P7fNOSVG@sirena.org.uk>
 <c74b0524-60c6-c3af-e35f-13521ba2b02e@linaro.org> <YoYw2lKbgCiDXP0A@lunn.ch>
 <YoZm9eabWy/FNKu1@sirena.org.uk>
 <0518eef1-75a6-fbfe-96d8-bb1fc4e5178a@linaro.org> <YodOO6PfsjelCa1x@Red>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YodOO6PfsjelCa1x@Red>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/05/2022 10:15, LABBE Corentin wrote:
> 
> I agree that supplies and supply-names are better.
> But in another answer Rob is against it, so if I understand well, we are stuck to use individual xxx-supply.
> I will try to create a new regulator_get_bulk_all() which scan all properties matching xxx-supply

Yep.


Best regards,
Krzysztof
