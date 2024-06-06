Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A9B13AD38
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Jun 2024 07:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717659764; cv=none; b=IQI3Tw34F391Th7Y8YciPPWd9sCfySx4scSjixchOO6nN58qQMzelUp7gnkanciBe5PTH2+kKsY9AZbeWvuZia/SDM3Dw/s3ryupj8RFBJOL41rfghkVHLs5Bb83I9GsXR/kOsE+tYCLOsirtkNPMQxKr4w/abWCrmD4PYhJ5UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717659764; c=relaxed/simple;
	bh=7OaWmqVFqUj8UiBMIFYvyTDVYpCRKRaVDuAaqAod2/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4EfKDHV0Ya++hO6Y8vo5nzM9cOFhIyXXi9CbO0uzyv0LaNXHvOHZw1a6Mn/jXYbvkWR6TRaTvhb81xcC2mCqXGbIGDT4JKx46BYWwAOdMlnyYPJUZzXQhTttVNyv+H2bSo+PIvD6y1AKlJzrWvrsyZA1UY9XI391feusIngltw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CcB0p3Q0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CcB0p3Q0"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a691bbb7031so86778266b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Jun 2024 00:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717659760; x=1718264560; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7hn7A2vtREo0E7HfSwjkC9hqptsOSWf7nUvmnuVDMQY=;
        b=CcB0p3Q0xis6ePdraJepTp3ggDp+Wbu0vmGwH9hdwxBx8E2Q7LAd2KA9W/sVCIkYe2
         EOaZJjL3U6DGe20Quq5FXvWWtpnWPO7mbF9kdH4rtsglIPdMnG1rML7xjIwtvx9O3yWR
         Ag0SUTJRv2smVW5XEd5cpMf9yq/IhsYTIonNR/13421juS5B7E0ErkvxPe7l68JfloF8
         itQP1++NB9LkcMs6nh24zKCNwM29LIgwQxdt+byUfv0l5P7q9tNKU3lFdvFoJdEQyKev
         km2puJoaMAmYfXZ8lYq1Z5uTAYuEcko5CFnAOuZwNIZFS8SoBKbi7nCQyHgBwYPxwItp
         0QUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717659760; x=1718264560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hn7A2vtREo0E7HfSwjkC9hqptsOSWf7nUvmnuVDMQY=;
        b=dIhTR9r6kzNGJI0T5XEDT8QkmfKJhLV5jV2CmmTOK4iCKjjIMj9FN9lUpkoD/fB9ue
         Upa4xLR6pl+RLorsyeQF6GxWtg9iNqzY1IqpQ6YsTUFMUZ7MsZVJynxeJc9Mq8mdVuTF
         X6SLMDds5TnT/rypLjEC1UQ9+bUy4/9GW5xad/Wp2zN5OnjqzmNVX2BUf9Bytq/qa59D
         x6ZRyQZvVTb9cQfRHcfCMIwlZ6yNSYxYP3jR7JgCaK+eJQFvp1xfOZrzGJFliOMuS6B3
         0/xZeFyW0tWPTKqlkRiwpaOzR4rojsiu2is/bypNjG521wzPBo/pCJUuWB2+ZHyjOfxS
         e9Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWAMknnlj6DKv3uV0zj3S8CatPpnj+fNOOyn4mlo/77j8Qg5Uta3bCLXnNIZ4NudVzftrwB8sHucDSWRBS/tR5yE6xoLLw1zeADnKY=
X-Gm-Message-State: AOJu0YzZOO51sSqbuJruuqUIYCfLQHCjcozuqWNsoswJN5iAs34l57KF
	pQEKB1yF2v413Oaq595ireUV+l/FMTeNgASjoLimUyHv/Y5MtDmoUkyZbRqE2do=
X-Google-Smtp-Source: AGHT+IG9fb84ekx6f8HaBtotI1FnubBAZuTJ3dgM/XdsdCeyuhCLEIFdUbolQkfIb3FKjJXzmIhddQ==
X-Received: by 2002:a17:907:900e:b0:a68:fe79:9499 with SMTP id a640c23a62f3a-a699f88b67cmr343464966b.40.1717659760015;
        Thu, 06 Jun 2024 00:42:40 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c806ebc43sm57149266b.141.2024.06.06.00.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:42:39 -0700 (PDT)
Date: Thu, 6 Jun 2024 10:42:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joy Chakraborty <joychakr@google.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	manugautam@google.com
Subject: Re: [PATCH v1 01/17] hwmon: pmbus: adm1266: Change nvmem
 reg_read/write return type
Message-ID: <08ff07f4-034d-4342-89da-d83044871ab1@moroto.mountain>
References: <20240605175953.2613260-1-joychakr@google.com>
 <20240605175953.2613260-2-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605175953.2613260-2-joychakr@google.com>

On Wed, Jun 05, 2024 at 05:59:45PM +0000, Joy Chakraborty wrote:
> Change nvmem read/write function definition return type to ssize_t.
> 
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> ---
>  drivers/hwmon/pmbus/adm1266.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 2c4d94cc8729..7eaab5a7b04c 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -375,7 +375,7 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
>  	return 0;
>  }
>  
> -static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
> +static ssize_t adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
>  {
>  	struct adm1266_data *data = priv;
>  	int ret;
> @@ -395,7 +395,7 @@ static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t
>  
>  	memcpy(val, data->dev_mem + offset, bytes);
>  
> -	return 0;
> +	return bytes;
>  }

This breaks the build so it's not allowed.  The way to do it is to:
1) add a new pointer which takes a ssize_t
2) convert everything to the new pointer
3) Rename the new pointer to the old name

regards,
dan carpenter

