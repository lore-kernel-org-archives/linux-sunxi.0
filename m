Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD633D6D
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717611131; cv=none; b=USZoWY+LG5z2dfqmCrbN9U4VdG9AP2KGCnqOAw0VuFKsNyfj5zeJoNj6bphO6vA+amLYKeU4NaQbgceaLEUCMjEqAEmW/mByqPzTbWuZBOH6EArBAlb6lK5+KK5iUTa6MeWsFzXBydTuaVoPFhlbD4FM0GAt3LrFuD9fIUDQai4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717611131; c=relaxed/simple;
	bh=z9OkqguqeJwlzfT4o/NLntU6DYYfOLDylgpwXRTP5l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIkpRrJ/2HmtntEBahgRSOGW6hpN8jb69xEerOU4PyPsAQue3yw5hKRLKyG1eC2QDqCOBl96jWjyIQ6uwfmsGhy0exVl8vCdYiQ7AVcIwyMJnsCyeZHjH26baaXX5y1UJc7UI9DgC164TrbNOU3PASFFULCevugwQ4XN1242W8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HtNzmf+P; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HtNzmf+P"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-421396e3918so2076055e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717611128; x=1718215928; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z9OkqguqeJwlzfT4o/NLntU6DYYfOLDylgpwXRTP5l0=;
        b=HtNzmf+PT8In6MmWqjnJqp0XpRncRzGOy0Bm5HpddQSucsxmu3Q7u2pnJ4UH37l6Oc
         /7hzZ5P4Aw/3wzNDYAotOWeUnGYwM8XsN5ij0c4K10orHsqDm6P+b9TpWGaE0QDx+jky
         Jhy2tY/4OSKSUtDYFeLcTuIHu4jGdft6KVZjarWuPFIxVVDa7FOxRfkHNMSV0nLxO2Ch
         Ub46SjyCqaCinTiG5zbYAkE0H3HxoUV/439M6EypY5Xl+h0J8DApaF9XXM7BipJzy5+8
         a2jJFYhXqP6X5ue2L8tyJ62s94bjdeW4ORKyT7iMk3zk2nja2DYlG0Hvetk7uB2dpE3I
         fHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717611128; x=1718215928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z9OkqguqeJwlzfT4o/NLntU6DYYfOLDylgpwXRTP5l0=;
        b=d+8FB18svZtvuBlg+1I98SHuyv2hwHsL+9toXv3LZupaUWZAPUuUdfTa0C/eBE1H/T
         M891Q11dKOzxoSRhQjrucZJDIGGwXxHScdf9+23400fIn9UYbjLi7wE0wdnb7JptC9x9
         E0mqeXceCr/Bkmdpr+OO0d05jXL4K2rhTTNwPzA2Z/tabFXCzZMrb5B5BYlYKSiNn8Y/
         i/z/DK0NVMO3oH46s8YpcSDKG3z65tM8Gn7wlOOj3YX0eAqjM/rer4kFDlV7l9sHJnBv
         5V7NLdIqsJAAcNZQ8faJk5dB4ZmAMwbpenL7Xxd/MPJpxFSvBJdlVcLv5RZp9VHdeYou
         ebzw==
X-Forwarded-Encrypted: i=1; AJvYcCVJPjUzwj+roFuYSrnnM+UFoDcwqZ+mEF+zVhbxmWf/3eky6T8UWAs/2ORKJ8cOJ5MG3MHaIYCUtMboFhu++Eal6gSf97RfgBSxJpo=
X-Gm-Message-State: AOJu0YwQcZfiJcXdGgOx6iU0lHv5v/qQwPvT71GlYH5Zw8qKgCgaGTa5
	DALzVY08dWEzAFf2FATx8xIuJ4DUTA1A/WyYCWhPwlXQGnBly7uBhkzPIhRxevY=
X-Google-Smtp-Source: AGHT+IEvaA8Q5QYjqCVUDlFHwF6aq9tSqiBZFVHoOS8pIX0aZ0OJo7FFt2ruymdqoNfkRUE1c/CDUw==
X-Received: by 2002:a05:600c:4e92:b0:421:29cd:5c95 with SMTP id 5b1f17b1804b1-421562ccd31mr34249765e9.10.1717611128459;
        Wed, 05 Jun 2024 11:12:08 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-35dd04d9c68sm15224191f8f.56.2024.06.05.11.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 11:12:07 -0700 (PDT)
Message-ID: <d7cfe53e-533a-4c39-b4d8-cdbee3617294@linaro.org>
Date: Wed, 5 Jun 2024 19:12:06 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/17] nvmem: Handle change of return type in
 reg_read/write() definition
To: Joy Chakraborty <joychakr@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, manugautam@google.com
References: <20240605175953.2613260-1-joychakr@google.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/06/2024 18:59, Joy Chakraborty wrote:
> Currently the nvmem core change is picked on
> https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git/log/?h=for-next
This patch is reverted due to next build failures.

Please resend the series with this included.


--srini
