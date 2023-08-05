Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917671FA5
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Aug 2023 07:11:15 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99bcc0adab4so403948566b.2
        for <linux-sunxi@lists.linux.dev>; Sat, 05 Aug 2023 00:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691219473; x=1691824273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yz1Cbq5253Upy7To/ILdOnCE5Vu7+PhjZfR51Q+MT6s=;
        b=kVBsnBXAst8PXr7P6TuBNNqhhTgsvdWI0aBKpLqxny1sUKGtgZ72tFDcjzGVfSlT99
         SvN5uc2riHYu1aZSQKLY8zf8nlVRg3r5xdWcH7jZLhlrNNHyJBHrDLrONdKkU+krKZ2U
         vrPqjPVXBLWW18Rv1UwLeeyAgsN/2gc77yxdnTSN19pqYQIddr7Qa4StGlTCP7PCo3WR
         rp858ABlDKH5e6V1blTFlnJ4cS6CrQXfaE1Dzq1EJVXhsBsc0D3onzOSCXJQJyZpNGsQ
         bwtsMBhN5BpkPNFSrmKpm02DNtR1dEQHWhhwIRlY5kf76c4N7cyx+8m9VoJ5zYFu/Fww
         F4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691219473; x=1691824273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yz1Cbq5253Upy7To/ILdOnCE5Vu7+PhjZfR51Q+MT6s=;
        b=IUISUtGnm8MdLiOC68Leh9EdzebrxuVCuoSUcHyfqdPN2wN9Pah6yvI44DoppF8llc
         qSjbdYEufrCVdx8i2EpUjhKcEwmAKsAM1EE4iD/PRudn0vmvDB8aLai7HOyoImss/k/4
         tpsI5DABqAgsHqmmZoPRwJLNE2jZLXD5qjRee/RaQ+N1Tw9+YX6u6bYTqm6wbhDPs4Mv
         74/t9bL+folYfrlRY52hVUGkTVEUSAo9oNF7gRFniMg3HKKWDuz0A7wGnB2AzGa15w5r
         j97lr8RJKQkarFkRIiZIEIZ7FVBLbmGW04lIsfTo8Gw+1pTzpFaQxf5T3EJUsoJOKN4u
         u7Kg==
X-Gm-Message-State: AOJu0Yzql+lnDvLW+4gLTNxUZLiNVQyFDJxB7S55rrpFfCPe/WHK3FxK
	gPfGObiS7wV6/72zHCLn90NJaA==
X-Google-Smtp-Source: AGHT+IHVXwWTCOCrS0wRiAaydBBmSEhSu6wADWazO1sTWMWKdjR9jO4VIRDIqoWcxpmUtm6UGNtZtw==
X-Received: by 2002:a17:907:b16:b0:99c:6fb6:ae7c with SMTP id h22-20020a1709070b1600b0099c6fb6ae7cmr3152947ejl.22.1691219473592;
        Sat, 05 Aug 2023 00:11:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id y8-20020a1709063a8800b0099316c56db9sm2283516ejd.127.2023.08.05.00.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 00:11:13 -0700 (PDT)
Message-ID: <d14663e2-2306-3eda-3760-ef2b4d4150e1@linaro.org>
Date: Sat, 5 Aug 2023 09:11:10 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: sunxi: add Mango Pi MQ-Quad
 binding
To: Matthew Croughan <matthew.croughan@nix.how>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230805044558.279473-2-matthew.croughan@nix.how>
 <20230805044558.279473-3-matthew.croughan@nix.how>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230805044558.279473-3-matthew.croughan@nix.how>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/08/2023 06:42, Matthew Croughan wrote:
> Document board compatible names for Mango Pi MQ-Quad
> 
> Signed-off-by: Matthew Croughan <matthew.croughan@nix.how>
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

No blank lines between tags.

Best regards,
Krzysztof

