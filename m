Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6F71DDCD
	for <linux-sunxi@lists.linux.dev>; Wed, 24 May 2023 21:43:46 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-510d92184faso3050512a12.1
        for <linux-sunxi@lists.linux.dev>; Wed, 24 May 2023 14:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard.com; s=google; t=1684964624; x=1687556624;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j4zQioTz5D+bXRL0seQOLRivI4MP136xofa2b6ops3E=;
        b=g6Ax582eTS+khljzt1qllAmCFtCOd/Zb3BoRwURYlAzhtIL4Mm/qgorVPE4xuCHmsN
         hDsbUuocX8WKv3ZEbZw+tDJd/y3RfsODC3d//iGG9/yxSQzQx56Qvi5Xfa4BwEC3zXjM
         oJ9GogORtdwPrkxdiq5vao175Q7H3RehEtrZiciK4HFFZQ0rcAVpNMhbtxvz66y4TEaU
         PoVB2TJSjFaGIwVJ1XWdsQ3qulOcUkFJwaGp6DkAAcvs3Pq/mTca+whhZVB2ttbltpWd
         SU1czNxyFBQwvGX040QENSBbwE4+oAwUc5+Rb+oVF4wNmGsmKRN0W9FkdMQcJkawiffF
         lvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684964624; x=1687556624;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4zQioTz5D+bXRL0seQOLRivI4MP136xofa2b6ops3E=;
        b=JL+hgHjq0g0dw1iWHc5Ivz4i8DLjEbUpNdXh4QqYDc+9Wb28+tQqcrr659CXph6wZm
         s91JbUTnBuCFIImSu0x/Og+UlotMibwTMPz49cPjHFPMsKsutkdUz1j3vf89Ue2nb1JN
         tXVvduxuoD0R+1aK6UKMeaex05hEK8JmKLMEPYlC6+f0FRgjH3AUe9yGqPt6ho0Ducav
         +Ggx31VtOuIE0gfr7/arfVFZHqkycEEFeo6K9LiTeUbttvNphXVWpF1xqLv4x5K934lP
         7FAUlfLXKAaV5iY2/HnrPdHMTxaGAJ2sqHr+ucyHSFCR9xwSBHOv8zB2yRSWojX2bb/b
         OJiQ==
X-Gm-Message-State: AC+VfDycpth9hxWagqPYXJJhL/qkt7KARLZJC4XscRugYyzP9SdbPo3B
	jQLSLTIwF6qkVQcqJcfiTWw5ww==
X-Google-Smtp-Source: ACHHUZ6h/E6wlOxa7TRUjOulLc3coiW6Vq+pK+cVudEpB9yTwlhbQ2jgubbtNXbTakoLykgPW6uqHg==
X-Received: by 2002:a17:907:940b:b0:973:84af:66e5 with SMTP id dk11-20020a170907940b00b0097384af66e5mr2690832ejc.40.1684964624552;
        Wed, 24 May 2023 14:43:44 -0700 (PDT)
Received: from [192.168.1.13] ([78.109.78.213])
        by smtp.googlemail.com with ESMTPSA id f19-20020a170906495300b0096f83b16ab1sm6268582ejt.136.2023.05.24.14.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 14:43:43 -0700 (PDT)
Message-ID: <30ea7de5-5bdf-4abd-17a9-7336c8c218db@wirenboard.com>
Date: Thu, 25 May 2023 00:43:41 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: qianfanguijin@163.com
Cc: jernej.skrabec@gmail.com, linux-sunxi@lists.linux.dev,
 mripard@kernel.org, wens@csie.org
References: <0527d592-3829-71b7-e040-d463793500e7@163.com>
Subject: Re: allwinner usb phy driver
Content-Language: en-GB
From: Evgeny Boger <boger@wirenboard.com>
Organization: Wiren Board
In-Reply-To: <0527d592-3829-71b7-e040-d463793500e7@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi qianfan,

Could you please check if this patch works for you?
https://lore.kernel.org/all/20220111165153.63632-1-boger@wirenboard.com/




