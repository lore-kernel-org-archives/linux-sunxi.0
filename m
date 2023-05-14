Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CA71877
	for <linux-sunxi@lists.linux.dev>; Sun, 14 May 2023 09:51:38 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so102632054a12.1
        for <linux-sunxi@lists.linux.dev>; Sun, 14 May 2023 02:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684057897; x=1686649897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1B3du+5hpvlLOa22naBqYj3xDgWNzyGiPg0V7Tn+jlA=;
        b=VsizmiPhgVVC017QpqyleBMJ6rMsZ6adYRvRLnGhJXvM5cBZfIoBWaE5nAB954jxuN
         st8r7Jl2src32zEaX6zbGMKCiu/DYREMSOJntv28ncNe4MSjbwcsNNkEmqojhzwQEMPy
         TiBhkH/9MVvjWgr9rszUv8nLkchIcB6+CUOdCpMWnINKSz68ArWroDy8k4La6Qykyg2n
         DOs0t3N/qXQmPLzO8QOvRH0VdPmTxIlbWAGttWitZNSWTlWdu+xemCmudRUbUvti2qmT
         KdJwNdT7SWSzkvsaP/xzEujH99ic+BiL12UtQqqlNMPnrRZ4vf9e45hbZUG1l+nuJ2Kv
         YrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684057897; x=1686649897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1B3du+5hpvlLOa22naBqYj3xDgWNzyGiPg0V7Tn+jlA=;
        b=KTlX8EDVLBf8yWzF45blDv9XFsJUhlgbf1VoT/hctvW3Q7gZjUjqjQPctf9pxSdGGv
         2cIMkv0E4KuEk9VQPf1rCKlEik9V8q1tLa9XZmsv0/VQsaAUKaQPkUqgTSVQ+WfLqAB0
         8Ejw6IAuCThGNH6fvxluYO0p0xHMfRTVaxQD69zvZ7VLRg0eGnFKwsx72rke/zeplLZ1
         S5IixvW/MVCBPBud8IkmdLm1qqVwFfYXz4qyaQhrqZ9tmG0F/SmAln8HwLZXVDD8dM3v
         VAPrrSH9k5OJ6YbE3RYJbqxDQllP3tgWNJrTNmrrmS0STXPPVgAtAPFkqB2F+TKY5Nyx
         69Ng==
X-Gm-Message-State: AC+VfDwtXI6LwtrGlAaoDvgvWvmfHd9nZdRBnD5KNdcjnZJkcSGh6Rau
	mbH8vb0pdBjZLK42GN8iykOTOg==
X-Google-Smtp-Source: ACHHUZ58XebRfUPqpJ87adEoTJVSm4nYzk/motHLFcYmh+n/Hi1XU9+7Z/l1hQUhfE06kxij9bcHjA==
X-Received: by 2002:a17:907:8689:b0:96a:316f:8aaa with SMTP id qa9-20020a170907868900b0096a316f8aaamr12388354ejc.37.1684057896845;
        Sun, 14 May 2023 02:51:36 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:715f:ddce:f2ba:123b])
        by smtp.gmail.com with ESMTPSA id r9-20020aa7cb89000000b005021d210899sm5663978edt.23.2023.05.14.02.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 02:51:36 -0700 (PDT)
Date: Sun, 14 May 2023 11:51:33 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rudi Heitbaum <rudi@heitbaum.com>
Cc: pabeni@redhat.com, alistair@alistair23.me,
	linux-arm-kernel@lists.infradead.org, jernej.skrabec@gmail.com,
	robh+dt@kernel.org, davem@davemloft.net,
	linux-bluetooth@vger.kernel.org, conor+dt@kernel.org,
	anarsoul@gmail.com, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, luiz.dentz@gmail.com,
	johan.hedberg@gmail.com, kuba@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, edumazet@google.com,
	marcel@holtmann.org, wens@csie.org, linux-kernel@vger.kernel.org,
	samuel@sholland.org, netdev@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: net: realtek-bluetooth: Add RTL8822BS
Message-ID: <20230514095133.b4ojnu6y222kzhcb@krzk-bin>
References: <20230514074731.70614-1-rudi@heitbaum.com>
 <20230514074731.70614-2-rudi@heitbaum.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230514074731.70614-2-rudi@heitbaum.com>

On Sun, 14 May 2023 07:47:29 +0000, Rudi Heitbaum wrote:
> Add compatible string for RTL8822BS for existing Realtek Bluetooth
> driver.
> 
> Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> ---
>  .../devicetree/bindings/net/realtek-bluetooth.yaml  | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/realtek-bluetooth.yaml: properties:compatible:oneOf:1:items: 'oneOf' conditional failed, one must be fixed:
	[{'enum': ['realtek,rtl8821cs-bt']}, {'const': ['realtek,rtl8822bs-bt', 'realtek,rtl8822cs-bt']}] is not of type 'object'
	['realtek,rtl8822bs-bt', 'realtek,rtl8822cs-bt'] is not of type 'integer', 'string'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/realtek-bluetooth.yaml: properties:compatible:oneOf:1:items: 'oneOf' conditional failed, one must be fixed:
	[{'enum': ['realtek,rtl8821cs-bt']}, {'const': ['realtek,rtl8822bs-bt', 'realtek,rtl8822cs-bt']}] is not of type 'object'
	['realtek,rtl8822bs-bt', 'realtek,rtl8822cs-bt'] is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
Traceback (most recent call last):
  File "/usr/local/bin/dt-validate", line 167, in <module>
    sg.check_trees(filename, testtree)
    ...
  File "/usr/lib/python3.10/sre_parse.py", line 599, in _parse
    raise source.error(msg, len(this) + 1 + len(that))
re.error: bad character range s-b at position 18

Note: You even broke the dtschema :)

See https://patchwork.ozlabs.org/patch/1781021

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
