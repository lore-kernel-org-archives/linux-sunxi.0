Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322447F
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 08:03:34 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id a15so20770318ljb.7
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 00:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h0SEv5+njF+NHP7in5GWyHvs6+61ZdhKoUhW5pFUx6k=;
        b=JU1gIejpkKuUWbOJmZBiobS407EzSG2JN6btj1k5B5e48yWLAXwm84GVv2d8W4iCZE
         kuKGaJWb+aTKp//7ft3khW0XVRwYMlFZZMOCdCuVesm3nYyBsrMeW4m8Te2/DIQbvP6U
         nQV3h5oqhDklhTK6HBHnPIvXA3MdMiAXdmS66UmhUVB3kb5ffCDupq7ergXreNJ5vVMO
         HHA10COZNV7xjmZUkKPrzSZ2ihSgA2RrSra0GUf2n+86/ao0Hhnk8PUsnWkgUcIqkcF3
         0TZW11CtAvL6MJUNxOcLlwCvAXM/3WGsNIP3/4PcGg+R6TFoUgMMtCTDXnuNSvEQ8Ky1
         MxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0SEv5+njF+NHP7in5GWyHvs6+61ZdhKoUhW5pFUx6k=;
        b=7ly9MyEGkyoStI3sG/4GqRw8ChqcleDOkECJVfAjP83MymdFegJtxMH3dRT1u4vy9j
         xyf/eM6dW1cUARuXVCmufEU3S57vm/QZ+DdDZJTwIQ4UAhlSJ3XJ0Ws9g6G8Ogc1VE9D
         RdFJs83URL+JNp34NTsZyeBT5/E8yj6Ij0m3bW/qgXwAmvjsgGgWGuvxAKrhpZzoKUVy
         wtTUyByQTeKSCOYu6SSlPmdWAZ03lOCrCEtQLeOEBeCMpEAom0j9rDM6IUXm2HVytmZG
         8b97qVMx3pCUsxY0BfjpIKsENsUKYAczPt3lwUu/z3OctABH0d11UtwgIR75cr7UuTuq
         Vrxg==
X-Gm-Message-State: ANoB5pnBn2C1qyU+4w3Xx17thbyxQTMBGUNq0KJZpt7AO5UBm1gt2Naw
	YPuvpaocBw7AEhqM61gMyj6gfQ==
X-Google-Smtp-Source: AA0mqf5tzrv9NDMC+SYz6A93cuTjMOX8upQj3+hLyU1Z+1nYPCDI3NcXemsbgnBGl2BdqoI4g/3tig==
X-Received: by 2002:a2e:300c:0:b0:277:524c:f83d with SMTP id w12-20020a2e300c000000b00277524cf83dmr7704707ljw.217.1668585812252;
        Wed, 16 Nov 2022 00:03:32 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f30-20020a05651c02de00b00277045dcb5bsm2860501ljo.97.2022.11.16.00.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 00:03:31 -0800 (PST)
Message-ID: <03e16d55-0110-bc3a-705f-a2a47d2876cc@linaro.org>
Date: Wed, 16 Nov 2022 09:03:30 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] ASoC: dt-bindings: sun50i-dmic: Add D1 compatible string
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Ban Tao <fengzheng923@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20221116034621.37762-1-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116034621.37762-1-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/11/2022 04:46, Samuel Holland wrote:
> The Allwinner D1 SoC has a DMIC codec like the one in the H6. It appears
> to be register-compatible with the H6 variant, and the existing Linux
> driver has been tested on a D1-based board, the Lichee RV 86 Panel.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

